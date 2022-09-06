Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4784D10E64E
 for <igt-dev@lists.freedesktop.org>; Tue,  6 Sep 2022 12:29:48 +0000 (UTC)
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue,  6 Sep 2022 15:29:27 +0300
Message-Id: <20220906122944.8838-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v2 00/17] tools/intel_vbt_decode: Improve
 VBT decoder
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

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

Sync uo the VBT decoder with the kernel code and
improve/add the decoding of various things.

Ville Syrjälä (17):
  tools/intel_vbt_decode: Fix mipi sequence block size
  tools/intel_vbt_decode: Validate fp_timing terminator presence
  tools/intel_vbt_decode: Use hardcoded fp_timing size for generating
    LFP data pointers
  tools/intel_vbt_decode: update vbt defs from kernel
  tools/intel_vbt_decode: Introduce panel_bits()/panel_bool()
  tools/intel_vbt_decode: Remove pointless variables
  tools/intel_vbt_decode: Extract lvds_config[]
  tools/intel_vbt_decode: Extract panel_fitting[]
  tools/intel_vbt_decode: Parse HDMI FRL rate
  tools/intel_vbt_decode: Decode the "use VBT vswing tables" flag
  tools/intel_vbt_decode: Decode eDP/DP max lane count
  tools/intel_vbt_decode: Clean up driver features block decoding
  tools/intel_vbt_decode: Decode AUX CH
  tools/intel_vbt_decode: Adjust DVO port printing
  tools/intel_vbt_decode: Dump the compression structure index as
    decimal
  tools/intel_vbt_decode: Dump all panels from MIPI blocks
  tools/intel_vbt_decode: Print panel_type2

 tools/intel_bios.h       |   8 -
 tools/intel_vbt_decode.c | 712 +++++++++++++++++++++++----------------
 tools/intel_vbt_defs.h   | 348 ++++++++++---------
 3 files changed, 622 insertions(+), 446 deletions(-)

-- 
2.35.1
