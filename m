Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Tue, 15 Feb 2022 14:13:31 -0000
Message-ID: <164493441121.15373.9710671724958091848@emeril.freedesktop.org>
References: <20220214150009.26815-1-jeevan.b@intel.com>
In-Reply-To: <20220214150009.26815-1-jeevan.b@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLkJVSUxEOiBmYWlsdXJlIGZvciBERzIg?=
 =?utf-8?q?platform_definition_and_Tile_4_plane_format_support_=28rev2=29?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Jeevan B <jeevan.b@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: DG2 platform definition and Tile 4 plane format support (rev2)
URL   : https://patchwork.freedesktop.org/series/99784/
State : failure

== Summary ==

IGT patchset build failed on latest successful build
4a18bc7336a88d1ce76510d19d346e4c26b22e9a test/amdgpu: Add ilr test

../lib/intel_device_info.c:524:2: note: in expansion of macro ‘INTEL_VGA_DEVICE’
  INTEL_VGA_DEVICE(PCI_MATCH_ANY, &intel_generic_info),
  ^~~~~~~~~~~~~~~~
../lib/i915_pciids.h:41:2: note: (near initialization for ‘intel_device_match[328].device_id’)
  0x030000, 0xff0000,   \
  ^~~~~~~~
../lib/intel_device_info.c:524:2: note: in expansion of macro ‘INTEL_VGA_DEVICE’
  INTEL_VGA_DEVICE(PCI_MATCH_ANY, &intel_generic_info),
  ^~~~~~~~~~~~~~~~
../lib/i915_pciids.h:41:12: warning: excess elements in scalar initializer
  0x030000, 0xff0000,   \
            ^~~~~~~~
../lib/intel_device_info.c:524:2: note: in expansion of macro ‘INTEL_VGA_DEVICE’
  INTEL_VGA_DEVICE(PCI_MATCH_ANY, &intel_generic_info),
  ^~~~~~~~~~~~~~~~
../lib/i915_pciids.h:41:12: note: (near initialization for ‘intel_device_match[328].device_id’)
  0x030000, 0xff0000,   \
            ^~~~~~~~
../lib/intel_device_info.c:524:2: note: in expansion of macro ‘INTEL_VGA_DEVICE’
  INTEL_VGA_DEVICE(PCI_MATCH_ANY, &intel_generic_info),
  ^~~~~~~~~~~~~~~~
../lib/i915_pciids.h:42:2: warning: excess elements in scalar initializer
  (unsigned long) info }
  ^
../lib/intel_device_info.c:524:2: note: in expansion of macro ‘INTEL_VGA_DEVICE’
  INTEL_VGA_DEVICE(PCI_MATCH_ANY, &intel_generic_info),
  ^~~~~~~~~~~~~~~~
../lib/i915_pciids.h:42:2: note: (near initialization for ‘intel_device_match[328].device_id’)
  (unsigned long) info }
  ^
../lib/intel_device_info.c:524:2: note: in expansion of macro ‘INTEL_VGA_DEVICE’
  INTEL_VGA_DEVICE(PCI_MATCH_ANY, &intel_generic_info),
  ^~~~~~~~~~~~~~~~
../lib/intel_device_info.c:428:57: error: missing braces around initializer [-Werror=missing-braces]
 static const struct pci_id_match intel_device_match[] = {
                                                         ^
../lib/intel_device_info.c:522:2:
  INTEL_DG2_IDS(&intel_dg2_info),
  {
../lib/intel_device_info.c:428:57: error: missing braces around initializer [-Werror=missing-braces]
 static const struct pci_id_match intel_device_match[] = {
                                                         ^
../lib/intel_device_info.c:522:2:
  INTEL_DG2_IDS(&intel_dg2_info),
  {
../lib/intel_device_info.c:525:1:
 };
 }
cc1: some warnings being treated as errors
ninja: build stopped: subcommand failed.

