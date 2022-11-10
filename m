Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2BCC310E152
 for <igt-dev@lists.freedesktop.org>; Thu, 10 Nov 2022 12:38:10 +0000 (UTC)
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu, 10 Nov 2022 13:38:02 +0100
Message-Id: <20221110123804.18486-1-kamil.konieczny@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v4 0/2] lib/igt_device_scan: add filer
 card=all
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Petri Latvala <petri.latvala@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Allow to select all (up to 64) discrete cards with the help of
card=all or card=*, for example:

./gem_basic --device=pci:vendor=intel,device=discrete,card=all

v2: correct misspelled word at patch 1/2 (Zbigniew), increase
  max number of filters from 16 to 64, stop filter splat at
  patch 2/2 (Petri)
v3: correct doc (patch 2/2)
v4: correct filter matching, reorganize loop (patch 2/2),
  tested on machine with two discrete cards

Cc: Petri Latvala <petri.latvala@intel.com>
Cc: "Zbigniew Kempczyński" <zbigniew.kempczynski@intel.com>

Kamil Konieczny (2):
  lib/igt_device_scan: refactor filter adding
  lib/igt_device_scan: add card=all filter selector

 lib/igt_device_scan.c | 46 +++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 44 insertions(+), 2 deletions(-)

-- 
2.34.1
