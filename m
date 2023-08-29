Return-Path: <igt-dev-bounces@lists.freedesktop.org>
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue, 29 Aug 2023 07:11:03 -0700
Message-Id: <20230829141107.1505705-1-lucas.demarchi@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH igt 0/4] Add LNL support to xe tests
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>, intel-xe@lists.freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Add Lunar Lake support so xe driver can be tested. This brings the new
xe_pciids.h from kernel since now the PCI IDs is not going to be added
on the i915 side.

Janga Rahul Kumar (1):
  tests/xe_debugfs: skip page table level check for Xe2

Lucas De Marchi (2):
  lib: Add xe_pciids.h
  lib/intel_chipset: Add Lunar Lake support

Zbigniew Kempczyński (1):
  lib/intel_device_info: Add blitter cmd info for Lunar Lake

 docs/reference/igt-gpu-tools/meson.build |   1 +
 lib/intel_chipset.h                      |   5 +
 lib/intel_device_info.c                  |  14 ++
 lib/xe_pciids.h                          | 215 +++++++++++++++++++++++
 tests/xe/xe_debugfs.c                    |  23 +--
 5 files changed, 248 insertions(+), 10 deletions(-)
 create mode 100644 lib/xe_pciids.h

-- 
2.40.1
