Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BFC7510E2DD
 for <igt-dev@lists.freedesktop.org>; Wed,  5 Apr 2023 06:52:53 +0000 (UTC)
Date: Wed, 5 Apr 2023 08:52:49 +0200
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Message-ID: <20230405085249.1aa1872f@maurocar-mobl2>
In-Reply-To: <20230404152958.yw5htrfsiyjgoidn@ldmartin-desk2.lan>
References: <20230328083908.2476581-1-mauro.chehab@linux.intel.com>
 <20230404062647.jhxel4t4c35ivb7c@ldmartin-desk2.lan>
 <20230404095200.28d713e3@maurocar-mobl2>
 <20230404152958.yw5htrfsiyjgoidn@ldmartin-desk2.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Subject: Re: [igt-dev] [PATCH i-g-t] xe/xe_huc_copy: use IS_TIGERLAKE macro
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: igt-dev@lists.freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Hi Lucas,

On Tue, 4 Apr 2023 08:29:58 -0700
Lucas De Marchi <lucas.demarchi@intel.com> wrote:

> On Tue, Apr 04, 2023 at 09:52:00AM +0200, Mauro Carvalho Chehab wrote:
> >On Mon, 3 Apr 2023 23:27:01 -0700
> >Lucas De Marchi <lucas.demarchi@intel.com> wrote:
> >  
> >> On Tue, Mar 28, 2023 at 10:39:08AM +0200, Mauro Carvalho Chehab wrote:  
> >> >From: Mauro Carvalho Chehab <mchehab@kernel.org>
> >> >
> >> >Instead of hardcoding the PCI IDs at the test, use a macro
> >> >to check if the platform is compatible with the test.
> >> >
> >> >Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>  
> >>
> >> neither this or the previous solution scale well. Can we get this info
> >> from huc_info in debugfs?
> >>
> >> We are already loading HuC in platforms other than TGL  
> >
> >Changing IGT to not use IS_platform macros anymore is not an easy task,
> >as this is used on lots of place, for both i915 and Xe drivers.  
> 
> I'm not talking generically everywhere in igt. I'm talking specifically
> about huc. For i915 there is a query, for xe we don't have it. But the
> same info can be obtained from the huc_info file in debugfs.

Ah, I see. I was thinking that you wanted to replace the IS_platform
macros with something else based on HuC debugfs data.

Yeah, for this specific sense, I fully agree that we need a better
solution to detect HuC and if it has support for whatever functionality
huc-specific tests are exercising.

Regards,
Mauro
