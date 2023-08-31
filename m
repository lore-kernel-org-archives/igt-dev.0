Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E2CEA10E089
 for <igt-dev@lists.freedesktop.org>; Thu, 31 Aug 2023 15:35:25 +0000 (UTC)
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu, 31 Aug 2023 17:35:15 +0200
Message-Id: <20230831153517.35370-1-kamil.konieczny@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 0/2] gitlab-ci/pull-or-rebuild: added debugs
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

Added braces to shell variables and print debugs in few places.

Kamil Konieczny (2):
  gitlab-ci/pull-or-rebuild: added braces for variables
  gitlab-ci/pull-or-rebuild: added few debug prints

 .gitlab-ci/pull-or-rebuild.sh | 42 ++++++++++++++++++-----------------
 1 file changed, 22 insertions(+), 20 deletions(-)

-- 
2.39.2
