Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A4186E483
 for <igt-dev@lists.freedesktop.org>; Thu, 27 Feb 2020 00:09:26 +0000 (UTC)
From: Akeem G Abodunrin <akeem.g.abodunrin@intel.com>
Date: Thu, 27 Feb 2020 00:09:24 +0000
Message-Id: <20200227000925.16988-1-akeem.g.abodunrin@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t v6 0/1] Support to assemble CB kernel for
 gen7
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
To: akeem.g.abodunrin@intel.com, igt-dev@lists.freedesktop.org, tony.luck@intel.com, jon.bloomfield@intel.com, sudeep.dutt@intel.com, daniel.vetter@intel.com, joonas.lahtinen@linux.intel.com, jani.nikula@intel.com, chris.p.wilson@intel.com, prathap.kumar.valsan@intel.com, mika.kuoppala@intel.com, francesco.balestrieri@intel.com, ville.syrjala@linux.intel.com, petri.latvala@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

Summary
-------
This is patch adds support to assemble CB kernel for gen7 and gen7.5
devices. It is needed for "Security mitigation for Intel Gen7/7.5 HWs"
Intel ID: PSIRT-TA-201910-001/CVEID: CVE-2019-14615.

Additional Note
---------------
IGT GPU tool changes in this patch, require latest Mesa tool to work
correctly. Generated CB kernel are imported to i915 driver, without need
for additional modifications. Users can use assembly sources provided
with this patch, and Mesa/igt to assemble CB kernel for verifications...

Akeem G Abodunrin (1):
  tools/generate_cb_kernel: Add script to assemble CB kernel

 lib/i915/shaders/clear_kernel/hsw.asm | 141 ++++++++++++++++++++++++
 lib/i915/shaders/clear_kernel/ivb.asm | 139 ++++++++++++++++++++++++
 scripts/generate_clear_kernel.sh      | 151 ++++++++++++++++++++++++++
 3 files changed, 431 insertions(+)
 create mode 100644 lib/i915/shaders/clear_kernel/hsw.asm
 create mode 100644 lib/i915/shaders/clear_kernel/ivb.asm
 create mode 100755 scripts/generate_clear_kernel.sh

-- 
2.24.0

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
