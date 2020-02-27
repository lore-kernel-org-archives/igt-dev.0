Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CBBB16EC6F
 for <igt-dev@lists.freedesktop.org>; Thu, 27 Feb 2020 09:15:32 +0000 (UTC)
Date: Thu, 27 Feb 2020 11:15:28 +0200
From: Petri Latvala <petri.latvala@intel.com>
Message-ID: <20200227091528.GJ3839@platvala-desk.ger.corp.intel.com>
References: <20200227000925.16988-1-akeem.g.abodunrin@intel.com>
 <20200227000925.16988-2-akeem.g.abodunrin@intel.com>
 <20200227091313.GI3839@platvala-desk.ger.corp.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200227091313.GI3839@platvala-desk.ger.corp.intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t v6 1/1] tools/generate_cb_kernel: Add
 script to assemble CB kernel
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Akeem G Abodunrin <akeem.g.abodunrin@intel.com>
Cc: tony.luck@intel.com, jani.nikula@intel.com, chris.p.wilson@intel.com, igt-dev@lists.freedesktop.org, jon.bloomfield@intel.com, daniel.vetter@intel.com, mika.kuoppala@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

On Thu, Feb 27, 2020 at 11:13:13AM +0200, Petri Latvala wrote:
> On Thu, Feb 27, 2020 at 12:09:25AM +0000, Akeem G Abodunrin wrote:
> > This patch adds script and applicable assembly sources, so that we can =
use
> > igt to assemble Clear Batch Buffer kernel for gen7 and gen7.5 devices -
> > Resultant header files would be imported to i915, and used as they are.=
..
> > =

> > With this patch, user need to have mesa configured on their platform,
> > before igt could be used to achieve the purpose of assembling the kernel
> > from source.
> > =

> > This is needed for "Security mitigation for Intel Gen7/7.5 HWs"
> > Intel ID: PSIRT-TA-201910-001/CVEID: CVE-2019-14615
> > =

> > v2: Addressed formatting, -g option and other minor issues (Petri)
> > v3: Update script due to suggested changes in i915, and Mesa tool
> > v4: Update help comment with Mesa build option with meson (Petri)
> > v5: Modify how user specify i965_asm - script now takes binary, instead
> > of Mesa tool source directory (Ville).
> > v6: Update script to reflect Mesa tool final changes to assemble CB
> > kernel - and renamed files based on Petri's suggestion...
> > =

> > Cc: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>
> > Cc: Jani Nikula <jani.nikula@intel.com>
> > Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
> > Cc: Petri Latvala <petri.latvala@intel.com>
> > Cc: Bloomfield Jon <jon.bloomfield@intel.com>
> > Signed-off-by: Akeem G Abodunrin <akeem.g.abodunrin@intel.com>
> =

> Patch subject slightly off but I'll change that when merging.

Which is done now.


-- =

Petri Latvala
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
