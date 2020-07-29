Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE77E6E4CB
 for <igt-dev@lists.freedesktop.org>; Wed, 29 Jul 2020 11:34:34 +0000 (UTC)
From: Petri Latvala <petri.latvala@intel.com>
Date: Wed, 29 Jul 2020 14:34:24 +0300
Message-Id: <20200729113425.29486-1-petri.latvala@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 1/2] runner/resultgen: Remember to close fd
 to aborted.txt
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

Signed-off-by: Petri Latvala <petri.latvala@intel.com>
Cc: Arkadiusz Hiler <arkadiusz.hiler@intel.com>
Cc: Lukasz Fiedorowicz <lukasz.fiedorowicz@intel.com>
---
 runner/resultgen.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/runner/resultgen.c b/runner/resultgen.c
index e2e162b0..3fe83b43 100644
--- a/runner/resultgen.c
+++ b/runner/resultgen.c
@@ -1637,6 +1637,7 @@ struct json_object *generate_results_json(int dirfd)
 		add_to_totals("runner", &abortsub, &results);
 
 		free_subtests(&abortsub);
+		close(fd);
 	}
 
 	free_settings(&settings);
-- 
2.20.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
