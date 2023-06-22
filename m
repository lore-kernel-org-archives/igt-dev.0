Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 18AD610E179
 for <igt-dev@lists.freedesktop.org>; Thu, 22 Jun 2023 06:02:40 +0000 (UTC)
From: Anshuman Gupta <anshuman.gupta@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu, 22 Jun 2023 11:32:26 +0530
Message-Id: <20230622060228.2885144-1-anshuman.gupta@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v3 0/2] PM Suspend debug
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: badal.nilawar@intel.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

This series enhance PM Suspend/Resume debug.

1. Disables console_suspend. 
   v1: https://patchwork.freedesktop.org/series/114517/
2. Enables /sys/power/pm_debug_messages.

Anshuman Gupta (2):
  lib/igt_aux: Disable console suspend for suspend test
  lib/igt_aux: Enable PM Suspend dbg messages

 lib/igt_aux.c | 55 +++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 55 insertions(+)

-- 
2.25.1
