Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 845746EE98
 for <igt-dev@lists.freedesktop.org>; Fri, 21 Feb 2020 06:07:26 +0000 (UTC)
From: Akeem G Abodunrin <akeem.g.abodunrin@intel.com>
Date: Thu, 20 Feb 2020 14:51:36 -0800
Message-Id: <20200220225137.18687-1-akeem.g.abodunrin@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t v3 0/1] Support to assemble CB kernel for
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
To: akeem.g.abodunrin@intel.com, jon.bloomfield@intel.com, sudeep.dutt@intel.com, daniel.vetter@intel.com, joonas.lahtinen@linux.intel.com, jani.nikula@intel.com, chris.p.wilson@intel.com, prathap.kumar.valsan@intel.com, mika.kuoppala@intel.com, francesco.balestrieri@intel.com, ville.syrjala@linux.intel.com, petri.latvala@intel.com, igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

Summary
-------
This is patch adds support to assemble CB kernel for gen7 and gen7.5
devices. It is needed for "Security mitigation for Intel Gen7/7.5 HWs"
Intel ID: PSIRT-TA-201910-001/CVEID: CVE-2019-14615.

Additional Note
---------------
The changes in the IGT GPU tool require latest MESA tool to work
correctly. Generated CB kernel are imported to i915 driver, without need
for additional modifications.

Akeem G Abodunrin (1):
  tools/generate_cb_buffer: Add script to assemble CB kernel

 scripts/asm_eu_kernel.sh                | 153 ++++++++++++++++++++++++
 tools/assembly_source/hsw_clear_buf.asm | 141 ++++++++++++++++++++++
 tools/assembly_source/ivb_clear_buf.asm | 139 +++++++++++++++++++++
 3 files changed, 433 insertions(+)
 create mode 100755 scripts/asm_eu_kernel.sh
 create mode 100644 tools/assembly_source/hsw_clear_buf.asm
 create mode 100644 tools/assembly_source/ivb_clear_buf.asm

-- 
2.20.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
