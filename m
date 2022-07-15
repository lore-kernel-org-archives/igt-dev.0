Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3527A10E275
 for <igt-dev@lists.freedesktop.org>; Fri, 15 Jul 2022 20:25:23 +0000 (UTC)
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Fri, 15 Jul 2022 23:25:06 +0300
Message-Id: <20220715202520.23677-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 00/14] tools/intel_vbt_decode: Improve VBT
 decoder
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

Improve the VBT decoder:
- bunch of cleanups
- some minor refactoring
- improved decoding of certain things
- decode even more stuff

Ville Syrjälä (14):
  tools/intel_vbt_decode: Simplify fast link training lane count
  tools/intel_vbt_decode: Extract dp_vswing()/dp_preemph()
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

 tools/intel_bios.h       |   8 -
 tools/intel_vbt_decode.c | 461 +++++++++++++++++++++------------------
 tools/intel_vbt_defs.h   | 342 ++++++++++++++++-------------
 3 files changed, 448 insertions(+), 363 deletions(-)

-- 
2.35.1
