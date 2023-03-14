Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F1BA910E753
 for <igt-dev@lists.freedesktop.org>; Tue, 14 Mar 2023 11:41:40 +0000 (UTC)
Received: from linux.intel.com (maurocar-mobl2.ger.corp.intel.com
 [10.252.14.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id 86281580C4C
 for <igt-dev@lists.freedesktop.org>; Tue, 14 Mar 2023 04:41:32 -0700 (PDT)
Received: from maurocar by linux.intel.com with local (Exim 4.96)
 (envelope-from <mauro.chehab@linux.intel.com>) id 1pc322-002j46-1u
 for igt-dev@lists.freedesktop.org; Tue, 14 Mar 2023 12:41:30 +0100
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue, 14 Mar 2023 12:41:21 +0100
Message-Id: <20230314114127.649447-1-mauro.chehab@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 0/6] Do some improvements at igt_doc.py
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

patch 1 better place mega-feature at the Xe hierarchy and improve
documentation about the structure to be followed;

The next patches add some features to the tool:

- The TestList class gains its own python module, better organizing
  the sources and allowing CI automation scripts to use it;
- It gains support to produce testlists from the documentation.

Mauro Carvalho Chehab (6):
  xe_test_config.json: do some adjustments at the output hierarchy
  scripts/igt_doc.py: move show_subtests logic to the class
  scripts/igt_doc.py: add support to generate testlists
  scripts/igt_doc.py: prepare to place TestList class on a separate file
  scripts/test_list.py: prepare to place class on a separate file
  scripts/igt_doc.py: re-introduce it by calling test_list.py

 scripts/igt_doc.py           | 1038 +--------------------------------
 scripts/test_list.py         | 1069 ++++++++++++++++++++++++++++++++++
 tests/xe/xe_test_config.json |   30 +-
 3 files changed, 1100 insertions(+), 1037 deletions(-)
 create mode 100755 scripts/test_list.py

-- 
2.39.2
