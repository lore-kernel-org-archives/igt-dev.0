Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E9BC210E039
 for <igt-dev@lists.freedesktop.org>; Tue, 22 Nov 2022 10:09:48 +0000 (UTC)
Date: Tue, 22 Nov 2022 12:10:04 +0200
From: Petri Latvala <petri.latvala@intel.com>
To: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Message-ID: <Y3yf/CH4LBXQAwW3@platvala-desk.ger.corp.intel.com>
References: <20221121170257.2022727-1-vikas.srivastava@intel.com>
 <20221121224602.xygdms5gt2d4wkme@ldmartin-desk2.lan>
 <20221122084646.coak7ptp5r5uf7yb@zkempczy-mobl2>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221122084646.coak7ptp5r5uf7yb@zkempczy-mobl2>
Subject: Re: [igt-dev] [PATCH i-g-t v3]tests/i915/gem_userptr_blits: Added
 XY_FAST_COPY_BLT Command for MTL
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: igt-dev@lists.freedesktop.org,
 Karolina Drobnik <karolina.drobnik@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Tue, Nov 22, 2022 at 09:46:46AM +0100, Zbigniew Kempczyński wrote:
> On Mon, Nov 21, 2022 at 02:46:02PM -0800, Lucas De Marchi wrote:
> > On Mon, Nov 21, 2022 at 10:32:57PM +0530, Vikas Srivastava wrote:
> > > From: Arjun Melkaveri <arjun.melkaveri@intel.com>
> > > 
> > > Test case uses legacy command which is not supported on MTL.
> > > Modified test to use XY_FAST_COPY_BLT.
> > > 
> > > Signed-off-by: Arjun Melkaveri <arjun.melkaveri@intel.com>
> > > Acked-by: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
> > 
> > $ git grep XY_SRC_COPY_BLT_CMD
> > lib/i830_reg.h:#define XY_SRC_COPY_BLT_CMD              ((2<<29)|(0x53<<22))
> > lib/intel_batchbuffer.c:        dword0 |= XY_SRC_COPY_BLT_CMD;
> > lib/intel_batchbuffer.c:        intel_bb_out(ibb, XY_SRC_COPY_BLT_CMD |
> > lib/intel_batchbuffer.h:        OUT_BATCH(XY_SRC_COPY_BLT_CMD | \
> 
> I would like to get rid of all libdrm stuff in intel_batchbuffer but there's
> one test which still references to it - prime_nv_test.c. 
> 
> + Petri, Kamil
> 
> May I remove this test? There're no users of it (there's no such hw we can
> test this on) so I see no reason to keep outdated and dead test.
> Anyway, I'm going to send the series, please decide in the meantime to
> accept it or reject.

tl;dr: Bitrotten test that could use a serious cleanup and
modernization. Go ahead and remove.


-- 
Petri Latvala
