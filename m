Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEF6FD68B36
	for <igt-dev@archiver.kernel.org>; Thu, 14 Nov 2024 16:29:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A75210E822;
	Thu, 14 Nov 2024 16:29:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CJRU5rEd";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D0FBB10E822
 for <igt-dev@lists.freedesktop.org>; Thu, 14 Nov 2024 16:29:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731601779; x=1763137779;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=0L2O3YOJjtoayB8T81jKIbL99j+1KlYCzeu2MSOhjvk=;
 b=CJRU5rEdAUNgUOxyh++ae1y9TbSWnnCcn4rUI6SdRSBWjEbmQUyX6ASv
 zLerlQPi1eUsE/nyzCSGMCalmqFetb7IwF0BYh+jm0qOqifxvQpvpiLtV
 BmdAnkOHJqSivQlpudyFlEZ7jssbYoeI2N/Cx9u/pe5j4Notn29EEULB4
 UdHbksDDNhaT4wCBSIfZmk82kIagWXyow+Kq0aQ7MApsuZLuEih6oUW/8
 cz3TrmrtBmp5S4Rl+rSstlMJFTrtvgIfL5hAK/EXfko0TZFg309rJqY0c
 NaiG37Ljd7s988IyKydQcI7oEC761gr7rkLseEBiMes8C6HsNX/fzlXjK g==;
X-CSE-ConnectionGUID: V8e2v3ybQtyTKXzXbA0Pvw==
X-CSE-MsgGUID: KrlI0Xx0TUmAgsueIhFiEg==
X-IronPort-AV: E=McAfee;i="6700,10204,11256"; a="42180184"
X-IronPort-AV: E=Sophos;i="6.12,154,1728975600"; d="scan'208";a="42180184"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2024 08:29:39 -0800
X-CSE-ConnectionGUID: wyzczKkSQ4aLFxYdeQEzbA==
X-CSE-MsgGUID: Xkk2Vs8ARrejEkcuKwrPdw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,154,1728975600"; d="scan'208";a="93334291"
Received: from art-dev-395.igk.intel.com ([10.102.138.231])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2024 08:29:37 -0800
From: "Maslak, Jan" <jan.maslak@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: dominik.grzegorzek@intel.com,
	"Maslak, Jan" <jan.maslak@intel.com>
Subject: [PATCH 2/2] tests/xe_eudebug_online: update thread count handling in
 query_attention_bitmask_size()
Date: Thu, 14 Nov 2024 16:28:43 +0000
Message-Id: <20241114162843.1210570-3-jan.maslak@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241114162843.1210570-1-jan.maslak@intel.com>
References: <20241114162843.1210570-1-jan.maslak@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>

---
 tests/intel/xe_eudebug_online.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/tests/intel/xe_eudebug_online.c b/tests/intel/xe_eudebug_online.c
index 0ef0d8093..514c59f8a 100644
--- a/tests/intel/xe_eudebug_online.c
+++ b/tests/intel/xe_eudebug_online.c
@@ -1118,7 +1118,9 @@ static bool intel_gen_has_lockstep_eus(int fd)
 
 static int query_attention_bitmask_size(int fd, int gt)
 {
-	const unsigned int threads = 8;
+	uint32_t thread_count_len;
+	uint32_t* thread_count_ptr;
+	uint32_t thread_count;
 	struct drm_xe_query_topology_mask *c_dss = NULL, *g_dss = NULL, *eu_per_dss = NULL;
 	struct drm_xe_query_topology_mask *topology;
 	struct drm_xe_device_query query = {
@@ -1130,6 +1132,10 @@ static int query_attention_bitmask_size(int fd, int gt)
 	int pos = 0, eus;
 	uint8_t *any_dss;
 
+	thread_count_ptr = xe_hwconfig_lookup_value(fd, INTEL_HWCONFIG_NUM_THREADS_PER_EU, &thread_count_len);
+	igt_assert(thread_count_ptr);
+	thread_count = *thread_count_ptr;
+
 	igt_assert_eq(igt_ioctl(fd, DRM_IOCTL_XE_DEVICE_QUERY, &query), 0);
 	igt_assert_neq(query.size, 0);
 
@@ -1178,8 +1184,9 @@ static int query_attention_bitmask_size(int fd, int gt)
 
 	free(any_dss);
 	free(topology);
+	free(thread_count_ptr);
 
-	return eus * threads / 8;
+	return eus * DIV_ROUND_UP(thread_count, 8);
 }
 
 static struct drm_xe_eudebug_event_exec_queue *
-- 
2.34.1

---------------------------------------------------------------------
Intel Technology Poland sp. z o.o.
ul. Slowackiego 173 | 80-298 Gdansk | Sad Rejonowy Gdansk Polnoc | VII Wydzial Gospodarczy Krajowego Rejestru Sadowego - KRS 101882 | NIP 957-07-52-316 | Kapital zakladowy 200.000 PLN.
Spolka oswiadcza, ze posiada status duzego przedsiebiorcy w rozumieniu ustawy z dnia 8 marca 2013 r. o przeciwdzialaniu nadmiernym opoznieniom w transakcjach handlowych.

Ta wiadomosc wraz z zalacznikami jest przeznaczona dla okreslonego adresata i moze zawierac informacje poufne. W razie przypadkowego otrzymania tej wiadomosci, prosimy o powiadomienie nadawcy oraz trwale jej usuniecie; jakiekolwiek przegladanie lub rozpowszechnianie jest zabronione.
This e-mail and any attachments may contain confidential material for the sole use of the intended recipient(s). If you are not the intended recipient, please contact the sender and delete all copies; any review or distribution by others is strictly prohibited.

