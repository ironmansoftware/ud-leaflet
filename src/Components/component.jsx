import React, {Component} from 'react';
import { Map, TileLayer } from 'react-leaflet';

export default class UDMap extends Component {

  componentDidMount() {
      document.getElementsByClassName('leaflet-container')[0].style.height = this.props.height;
      document.getElementsByClassName('leaflet-container')[0].style.width = this.props.width;
  }

  render() {
    const position = [this.props.lat, this.props.lng]
      return (
        
          <Map center={position} zoom={this.props.zoom}>
            <TileLayer
              attribution='&amp;copy <a href="http://osm.org/copyright">OpenStreetMap</a> contributors'
              url="https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png"
            />
          </Map>
        

      )
  }
}