Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2922D10EBFE
 for <igt-dev@lists.freedesktop.org>; Mon,  8 Aug 2022 16:20:09 +0000 (UTC)
From: Ryszard Knop <ryszard.knop@intel.com>
To: Development mailing list for IGT GPU Tools <igt-dev@lists.freedesktop.org>
Date: Mon,  8 Aug 2022 18:18:19 +0200
Message-Id: <20220808161825.1942387-1-ryszard.knop@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v2 0/7] Add the --environment flag
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

It sets the provided KEY=VALUE pair as the environment variable for
executed test processes. If just the KEY is provided, the currently-set
value is reused (and the run fails if it's not set for the runner).

The most important thing about this feature is that all the variables
set this way are saved for resumed runs as well. This lets developers
easily try something out from the terminal without having to remember
to set the same vars/reuse a wrapper to continue a run.

v2:
- [2/7] usage(msg, ...) -> usage(stderr) (Maira)
- [2/7] __attribute__ ((format (...))) (Petri)
- [3/7] Moved warning fixes from later commits here
- [3/7] igt_list_empty_or_null -> igt_list_empty (Mauro)
- [3/7] Optimized the parser, more error handling (Mauro)
- [4/7] Simplify env var reading from files (Mauro)
- [4/7] Don't align settings loading block (Mauro)
- [4/7] Make filenames static const (Mauro)
- [5/7] Removed unnecessary checks, misc cleanup (Mauro)
- [7/7] Added requested tests (Mauro)

