Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 86E866E117
 for <igt-dev@lists.freedesktop.org>; Mon,  2 Nov 2020 18:12:36 +0000 (UTC)
Date: Mon, 2 Nov 2020 20:12:31 +0200
From: Imre Deak <imre.deak@intel.com>
Message-ID: <20201102181231.GA3915554@ideak-desk.fi.intel.com>
References: <20201023130526.3983076-1-mika.kahola@intel.com>
 <20201023130526.3983076-3-mika.kahola@intel.com>
 <20201102172705.GA3914202@ideak-desk.fi.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201102172705.GA3914202@ideak-desk.fi.intel.com>
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
To: Mika Kahola <mika.kahola@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

On Mon, Nov 02, 2020 at 07:27:05PM +0200, Imre Deak wrote:
> [...]
> On Fri, Oct 23, 2020 at 04:05:26PM +0300, Mika Kahola wrote:
> > @@ -274,16 +279,25 @@ gen7_fill_vertex_buffer_data(struct intel_bb *ibb,
> >  	offset = intel_bb_offset(ibb);
> >  
> >  	emit_vertex_2s(ibb, dst_x + width, dst_y + height);
> > -	emit_vertex_normalized(ibb, src_x + width, intel_buf_width(src));
> > -	emit_vertex_normalized(ibb, src_y + height, intel_buf_height(src));
> > +
> > +	if (src != NULL) {
> > +		emit_vertex_normalized(ibb, src_x + width, intel_buf_width(src));
> > +		emit_vertex_normalized(ibb, src_y + height, intel_buf_height(src));

The x coords need to be scaled down by 64 pixels, the y coords by 16 lines.

--Imre

> > +	}
> 
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
