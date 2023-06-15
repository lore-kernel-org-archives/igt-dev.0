Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 47C9810E4AD
 for <igt-dev@lists.freedesktop.org>; Thu, 15 Jun 2023 09:47:27 +0000 (UTC)
Received: from linux.intel.com (maurocar-mobl2.ger.corp.intel.com
 [10.252.22.209])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id C5985580D93
 for <igt-dev@lists.freedesktop.org>; Thu, 15 Jun 2023 02:47:25 -0700 (PDT)
Received: from maurocar by linux.intel.com with local (Exim 4.96)
 (envelope-from <mauro.chehab@linux.intel.com>) id 1q9jZb-00FlDK-1Q
 for igt-dev@lists.freedesktop.org; Thu, 15 Jun 2023 11:47:23 +0200
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu, 15 Jun 2023 11:47:20 +0200
Message-Id: <20230615094722.3756326-1-mauro.chehab@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 0/2] Enable Xe KUnit tests and fix a warning
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

From: Mauro Carvalho Chehab <mchehab@kernel.org>

This small series add Xe live selftests to the BAT execution and
fixes a warning introduced by KUnit patch series.

Mauro Carvalho Chehab (2):
  lib/igt_kmod: fill skip message for KUnit skips
  intel-ci: add Xe live KUnit tests to BAT testlist

 lib/igt_kmod.c                           | 20 +++++++++++++-------
 tests/intel-ci/xe-fast-feedback.testlist |  3 +++
 2 files changed, 16 insertions(+), 7 deletions(-)

-- 
2.40.1
