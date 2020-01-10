Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 262066E9DF
 for <igt-dev@lists.freedesktop.org>; Fri, 10 Jan 2020 12:06:52 +0000 (UTC)
From: Petri Latvala <petri.latvala@intel.com>
Date: Fri, 10 Jan 2020 14:06:40 +0200
Message-Id: <20200110120642.19844-1-petri.latvala@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t v2 0/2] runner: Unprintable characters in
 json
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
Cc: Petri Latvala <petri.latvala@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

Rebase of https://patchwork.freedesktop.org/series/70492/ adjusted for
handling dynamic subtest outputs. Patch 2/2 won't survive sending by
email, or patchwork's handling, but
https://gitlab.freedesktop.org/adrinael/igt-gpu-tools/commits/unprintable
has this version.

Petri Latvala (2):
  runner: Ensure generated json is properly UTF8-encoded
  runner/json_tests: Test handling of unprintable output from tests

 .../unprintable-characters/0/dmesg.txt        |   5 +
 .../unprintable-characters/0/err.txt          | 258 +++++++++++++++++
 .../unprintable-characters/0/journal.txt      |   2 +
 .../unprintable-characters/0/out.txt          | 259 ++++++++++++++++++
 .../unprintable-characters/README.txt         |   2 +
 .../unprintable-characters/endtime.txt        |   1 +
 .../unprintable-characters/joblist.txt        |   1 +
 .../unprintable-characters/metadata.txt       |  12 +
 .../unprintable-characters/reference.json     |  72 +++++
 .../unprintable-characters/starttime.txt      |   1 +
 .../unprintable-characters/uname.txt          |   1 +
 runner/resultgen.c                            |  45 ++-
 runner/runner_json_tests.c                    |   1 +
 13 files changed, 650 insertions(+), 10 deletions(-)
 create mode 100644 runner/json_tests_data/unprintable-characters/0/dmesg.txt
 create mode 100644 runner/json_tests_data/unprintable-characters/0/err.txt
 create mode 100644 runner/json_tests_data/unprintable-characters/0/journal.txt
 create mode 100644 runner/json_tests_data/unprintable-characters/0/out.txt
 create mode 100644 runner/json_tests_data/unprintable-characters/README.txt
 create mode 100644 runner/json_tests_data/unprintable-characters/endtime.txt
 create mode 100644 runner/json_tests_data/unprintable-characters/joblist.txt
 create mode 100644 runner/json_tests_data/unprintable-characters/metadata.txt
 create mode 100644 runner/json_tests_data/unprintable-characters/reference.json
 create mode 100644 runner/json_tests_data/unprintable-characters/starttime.txt
 create mode 100644 runner/json_tests_data/unprintable-characters/uname.txt

-- 
2.20.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
