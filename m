Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5973910E2FD
 for <igt-dev@lists.freedesktop.org>; Tue, 17 Jan 2023 14:06:21 +0000 (UTC)
Received: from linux.intel.com (maurocar-mobl2.ger.corp.intel.com
 [10.252.27.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id A5087580DF8
 for <igt-dev@lists.freedesktop.org>; Tue, 17 Jan 2023 06:06:19 -0800 (PST)
Received: from maurocar by linux.intel.com with local (Exim 4.96)
 (envelope-from <mauro.chehab@linux.intel.com>) id 1pHmbR-00Ba0s-1x
 for igt-dev@lists.freedesktop.org; Tue, 17 Jan 2023 15:06:17 +0100
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue, 17 Jan 2023 15:05:55 +0100
Message-Id: <20230117140607.2759816-1-mauro.chehab@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 00/12] Improve code coverage tool
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

Add several new features to code_cov_parse_info:
- Add experimental support for using JSON files directly,
  without needing to use lcov tool;
- The tool can now store files in gzipped format;
- Add better support for filtering and working with branches;
- Add experimental support for filtering data from the
  upcoming Xe driver.

Mauro Carvalho Chehab (12):
  code_cov_parse_info: silent some messages by default
  code_cov_parse_info: do some renames to make it more coherent
  code_cov_parse_info: use numberic sort for line numbers
  code_cov_parse_info: better handle include regexes
  code_cov_parse_info: add a tool to analyze branch coverage
  code_cov_parse_info: add support for parsing JSON files
  code_cov_parse_info: add support for compressed files
  code_cov_parse_info: allow specifying the source directory
  code_cov_parse_info: better handle branch filtering
  code_cov_parse_info: filter out branches from headers by default
  code_cov_parse_info: add support for filtering branches
  code_cov_parse_info: add support for filtering Xe driver data

 scripts/code_cov_parse_info | 881 +++++++++++++++++++++++++++++++-----
 1 file changed, 768 insertions(+), 113 deletions(-)

-- 
2.39.0
