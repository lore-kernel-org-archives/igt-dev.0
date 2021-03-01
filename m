Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A0816E43C
 for <igt-dev@lists.freedesktop.org>; Mon,  1 Mar 2021 07:33:49 +0000 (UTC)
Date: Mon, 1 Mar 2021 09:34:08 +0200
From: Petri Latvala <petri.latvala@intel.com>
Message-ID: <YDyY8PhAzy9+7vTd@platvala-desk.ger.corp.intel.com>
References: <20210227221041.541550-1-raj.khem@gmail.com>
 <c8685b17-e199-2f2d-24ef-c53688d45465@mupuf.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <c8685b17-e199-2f2d-24ef-c53688d45465@mupuf.org>
Subject: Re: [igt-dev] [PATCH i-g-t] lib/igt_edid: Allocate raw 8-bytes for
 VSDB
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Martin Peres <martin.peres@mupuf.org>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

On Sun, Feb 28, 2021 at 12:03:22PM +0200, Martin Peres wrote:
> On 28/02/2021 00:10, Khem Raj wrote:
> > hdmi_vsdb is an element of cea_vsdb which makes the size of cea_vsdb to
> > be 8 ( 3bytes ieee_oui ) + ( 5bytes hdmi_vsdb struct), its true that we
> > only use 7 bytes technically we can only allocate 7byte array but since
> > we are writing to elements of hdmi_vsdb struct which is sitting at offet
> > 4-8 in cea_vsdb, compiler thinks we have an element which is out of
> > array bounds since out allocated size is 7bytes
> > 
> > This errors out
> > ../git/lib/igt_edid.c:365:13: error: array subscript 'struct hdmi_vsdb[0]' is partly outside array bounds of 'char[7]' [-Werror=array-bounds]
> >    365 |         hdmi->src_phy_addr[0] = 0x10;
> >        |             ^~
> > 
> > allocating one extra byte matches with size of cea_vsdb and compiler is
> > happy
> > 
> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> 
> Lookgs good to me, thanks!
> 
> Reviewed-by: Martin Peres <martin.peres@mupuf.org>


Merged, thanks.


-- 
Petri Latvala
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
