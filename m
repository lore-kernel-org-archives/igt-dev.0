Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0230D6E111
 for <igt-dev@lists.freedesktop.org>; Thu,  5 Nov 2020 14:26:06 +0000 (UTC)
Date: Thu, 5 Nov 2020 16:26:02 +0200
From: Imre Deak <imre.deak@intel.com>
Message-ID: <20201105142602.GA177799@ideak-desk.fi.intel.com>
References: <20201023130526.3983076-1-mika.kahola@intel.com>
 <20201023130526.3983076-3-mika.kahola@intel.com>
 <20201102172705.GA3914202@ideak-desk.fi.intel.com>
 <d600c631c0c0478ab43d96a40d8e4d59@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <d600c631c0c0478ab43d96a40d8e4d59@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t v7 2/2] tests/kms_ccs: CCS Clear Color
 test
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: imre.deak@intel.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: "Kahola, Mika" <mika.kahola@intel.com>
Cc: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Thu, Nov 05, 2020 at 03:33:57PM +0200, Kahola, Mika wrote:
> [....]
> > > @@ -274,16 +279,25 @@ gen7_fill_vertex_buffer_data(struct intel_bb
> > *ibb,
> > >  	offset = intel_bb_offset(ibb);
> > >
> > >  	emit_vertex_2s(ibb, dst_x + width, dst_y + height);
> > > -	emit_vertex_normalized(ibb, src_x + width, intel_buf_width(src));
> > > -	emit_vertex_normalized(ibb, src_y + height, intel_buf_height(src));
> > > +
> > > +	if (src != NULL) {
> > > +		emit_vertex_normalized(ibb, src_x + width, intel_buf_width(src));
> > > +		emit_vertex_normalized(ibb, src_y + height, intel_buf_height(src));
> > > +	}
> > 
> > For the !src case you also need to emit the two source vertex elements to
> > keep the VUE format we defined in gen6_emit_vertex_elements().
> 
> In this case we don't have src, what should we define as source vertex
> element? Are those src_*, width/height and intel_buf_width/height()
> just zeros?

Yes, just two 0s in float format, so two emit_vertex(0). The alternative
would be to change the vertex layout, but I think it's simpler this way.

--Imre
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
