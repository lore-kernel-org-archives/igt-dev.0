Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6880E10EAB1
 for <igt-dev@lists.freedesktop.org>; Fri, 13 Jan 2023 19:26:02 +0000 (UTC)
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Fri, 13 Jan 2023 20:25:51 +0100
Message-Id: <20230113192553.89460-1-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 0/2] Remove -fcommon flag
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

During reviewing Karolina series I realized I've incidentally
put crc32 table to common section instead of properly define it
in .c file and extern.

Since gcc-10 -fcommon is removed and using this flag is deprecated
remove it from the IGTs too. 

Zbigniew Kempczyński (2):
  lib/igt_crc: Remove crc32 table from common section
  meson.build: Remove -fcommon flag

 lib/igt_crc.h | 2 +-
 meson.build   | 1 -
 2 files changed, 1 insertion(+), 2 deletions(-)

-- 
2.34.1
