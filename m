Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 026D310EAFB
 for <igt-dev@lists.freedesktop.org>; Thu,  9 Feb 2023 14:12:23 +0000 (UTC)
From: Karolina Stolarek <karolina.stolarek@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu,  9 Feb 2023 15:12:03 +0100
Message-Id: <cover.1675950055.git.karolina.stolarek@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v3 0/9] Extend and rename intel_tiling_info
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

It was decided that the former blt_cmd_info struct will not only host
information on command properties, but will also describe non-blitter
copy commands. Because of this, in v3 we rename related structs,
functions and variables. To make reviewing easier, the additional
rename was split into three commits: intel_cmds_info definitions
update, supported_cmds field rename and intel_cmds_info getter
rename.

The most important name updates are:
  - intel_tiling_info lib ---> intel_cmds_info lib
  - blt_cmd_info struct ---> intel_cmds_info struct
  - blt_tiling_info struct ---> blt_cmd_info struct

v3:
  - Rename blt_cmds_desc struct to intel_cmds_info
  - Update ifdef in intel_cmds_info header (it still said TILING)
  - Move blt_get_cmd_info() helper from i915_blt to the library,
    make it public
  - Change supported_cmds field name to blt_cmds, as it only refers
    to the blitter copy commands
  - Correct MTL definition
  - Smaller renames, such as GET_BLT_INFO --> GET_CMDS_INFO

v2:
  - Rename the library and its structs to better describe what
    they store
  - Stop using has_flatccs field when checking if a command
    can use compression; use blt_cmd_info flags field instead
  - Update the name of blt_tiling field in intel_device_info,
    as it describes more than just a list of supported tiling
    formats
  - Drop additional macros for DG2 and MTL definitions

Karolina Stolarek (9):
  lib/intel_tiling_info: Rename blt_cmd_info to intel_cmds_info
  lib/intel_tiling_info: Update names of commands definitions
  lib/intel_tiling_info: Update intel_cmds_info field name
  lib/intel_device_info: Update name for cmds_info getter
  lib/intel_tiling_info: Rename blt_tiling_info to blt_cmd_info
  lib/i915: Rename intel_tiling_info library
  lib/intel_cmds_info: Add flags field to describe command properties
  lib/i915_blt: Add checks for command properties
  tests/gem_ccs: Check for extended block-copy and compression support

 lib/i915/i915_blt.c          | 121 +++++++++++++++++++++++-----------
 lib/i915/i915_blt.h          |  15 +++--
 lib/i915/intel_cmds_info.c   | 122 +++++++++++++++++++++++++++++++++++
 lib/i915/intel_cmds_info.h   |  55 ++++++++++++++++
 lib/i915/intel_tiling_info.c |  95 ---------------------------
 lib/i915/intel_tiling_info.h |  48 --------------
 lib/intel_chipset.h          |   6 +-
 lib/intel_device_info.c      |  68 +++++++++----------
 lib/meson.build              |   6 +-
 tests/i915/gem_ccs.c         |   7 +-
 10 files changed, 313 insertions(+), 230 deletions(-)
 create mode 100644 lib/i915/intel_cmds_info.c
 create mode 100644 lib/i915/intel_cmds_info.h
 delete mode 100644 lib/i915/intel_tiling_info.c
 delete mode 100644 lib/i915/intel_tiling_info.h

-- 
2.25.1
