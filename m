Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9AD9E10E780
 for <igt-dev@lists.freedesktop.org>; Wed,  8 Feb 2023 13:48:14 +0000 (UTC)
From: Karolina Stolarek <karolina.stolarek@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Wed,  8 Feb 2023 14:47:33 +0100
Message-Id: <cover.1675854161.git.karolina.stolarek@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v2 0/6] Extend and rename intel_tiling_info
 library
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

As for now, there is no central place that provides information on
command properties such as compression support or if the command
requires any additional setup. It is possible to modify the already
existing library, intel_tiling_info, and add such information there.

The series adds a new field to better describe blitter commands,
which stores bit flags describing properties. Flags defined as a part
of the series mostly target the block-copy command, as its features
vary the most between generations. The introduction of the field is
followed by an update of DG2 and MTL definitions and gem_ccs test.

This change means that intel_tiling_info library stores more than
just information on tiling formats. As keeping a tiling-specific
name would confuse users, we update the struct names as well as
the library name itself. Each of the renames happens in a separate
commit.

To summarize the name update:
  - intel_tiling_info lib ---> intel_cmds_info lib
  - blt_cmd_info struct ---> blt_cmds_desc struct
  - blt_tiling_info struct ---> blt_cmd_info struct

Although the proposed change was expanded so much that it could be
a standalone series, I decided to label it v2 to link to the work
I sent as a single patch in [1].

v2:
  - Rename the library and its structs to better describe what
    they store
  - Stop using has_flatccs field when checking if a command
    can use compression; use blt_cmd_info flags field instead
  - Update the name of blt_tiling field in intel_device_info,
    as it describes more than just a list of supported tiling
    formats
  - Drop additional macros for DG2 and MTL definitions

[1] - https://patchwork.freedesktop.org/series/113595/

Karolina Stolarek (6):
  lib/intel_tiling_info: Rename blt_cmd_info to blt_cmds_desc
  lib/intel_tiling_info: Rename blt_tiling_info to blt_cmd_info
  lib/i915: Rename intel_tiling_info library
  lib/intel_cmds_info: Add flags field to describe command properties
  lib/i915_blt: Add checks for command properties
  tests/gem_ccs: Check for extended block-copy and compression support

 lib/i915/i915_blt.c                           | 112 +++++++++++++-----
 lib/i915/i915_blt.h                           |  15 ++-
 ...{intel_tiling_info.c => intel_cmds_info.c} |  58 +++++----
 ...{intel_tiling_info.h => intel_cmds_info.h} |  22 ++--
 lib/intel_chipset.h                           |   6 +-
 lib/intel_device_info.c                       |  64 +++++-----
 lib/meson.build                               |   6 +-
 tests/i915/gem_ccs.c                          |   7 +-
 8 files changed, 184 insertions(+), 106 deletions(-)
 rename lib/i915/{intel_tiling_info.c => intel_cmds_info.c} (57%)
 rename lib/i915/{intel_tiling_info.h => intel_cmds_info.h} (53%)

-- 
2.25.1
