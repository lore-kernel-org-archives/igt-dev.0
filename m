Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F3EC6ECA0
 for <igt-dev@lists.freedesktop.org>; Tue,  3 Nov 2020 14:01:28 +0000 (UTC)
Date: Tue, 3 Nov 2020 16:00:47 +0200
From: Imre Deak <imre.deak@intel.com>
Message-ID: <20201103140047.GB3990501@ideak-desk.fi.intel.com>
References: <20201023130526.3983076-1-mika.kahola@intel.com>
 <20201023130526.3983076-3-mika.kahola@intel.com>
 <20201102172705.GA3914202@ideak-desk.fi.intel.com>
 <20201102181231.GA3915554@ideak-desk.fi.intel.com>
 <002dd574e94644389425fc01a0fdee0c@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <002dd574e94644389425fc01a0fdee0c@intel.com>
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

On Tue, Nov 03, 2020 at 03:55:19PM +0200, Kahola, Mika wrote:
> > -----Original Message-----
> > From: Imre Deak <imre.deak@intel.com>
> > Sent: Monday, November 2, 2020 8:13 PM
> > To: Kahola, Mika <mika.kahola@intel.com>
> > Cc: igt-dev@lists.freedesktop.org
> > Subject: Re: [igt-dev] [PATCH i-g-t v7 2/2] tests/kms_ccs: CCS Clear Color test
> > 
> > On Mon, Nov 02, 2020 at 07:27:05PM +0200, Imre Deak wrote:
> > > [...]
> > > On Fri, Oct 23, 2020 at 04:05:26PM +0300, Mika Kahola wrote:
> > > > @@ -274,16 +279,25 @@ gen7_fill_vertex_buffer_data(struct intel_bb
> > *ibb,
> > > >  	offset = intel_bb_offset(ibb);
> > > >
> > > >  	emit_vertex_2s(ibb, dst_x + width, dst_y + height);
> > > > -	emit_vertex_normalized(ibb, src_x + width, intel_buf_width(src));
> > > > -	emit_vertex_normalized(ibb, src_y + height, intel_buf_height(src));
> > > > +
> > > > +	if (src != NULL) {
> > > > +		emit_vertex_normalized(ibb, src_x + width,
> > intel_buf_width(src));
> > > > +		emit_vertex_normalized(ibb, src_y + height,
> > intel_buf_height(src));
> > 
> > The x coords need to be scaled down by 64 pixels, the y coords by 16 lines.
> 
> So you mean that dst coordinates in case of Clear Color should be scaled down, x by 64 pixels and y by 16 lines?

Yes, both x and width by 64 pixels and both y and height by 16 lines.

> 
> > 
> > --Imre
> > 
> > > > +	}
> > >
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
