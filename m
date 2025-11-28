Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96433D116F3
	for <igt-dev@archiver.kernel.org>; Fri, 28 Nov 2025 14:14:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2323E10E90F;
	Fri, 28 Nov 2025 14:14:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nPXYX6kl";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 618CE10E90B
 for <igt-dev@lists.freedesktop.org>; Fri, 28 Nov 2025 14:14:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764339276; x=1795875276;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=rOlkZix2vhlI7V8H7qtfT+ZkP8myyu4jjpjWxN2O99I=;
 b=nPXYX6kl5duUGg+Hzw86Rz81XNULKAAY4a1RgBnbDYTvJsRAu56FJJlG
 SAITME0ohXajlgQ8OU+8DJWozksw3gh8xLcAtaDBu491mRICOFRNHllal
 1yJUN0LAe8zbBsVDN5ydOW/M/NKl5nQaBMDcWs9HrB9Ev46WYo0sNCwRy
 tIiv7EUEA1JTmX3kxSfZ4sjCvoweoyh/7KhDyCBg2rJvYqzj25rwp7v2Q
 hFm6KN96im0uc/hIb/XvqsB9b5DHGhJBq7tbPnWm2/vaEW5AvSB3+hQ4e
 wRtSce9uBvV58OgpLbBQNUR4fvirTp9HpYK/9jaq2fQ899LIvfyzkJSzk g==;
X-CSE-ConnectionGUID: nk4WrFYyRUavuzsZbyucjg==
X-CSE-MsgGUID: 5Vd1GMOSQHWwHB0Rvmx1ew==
X-IronPort-AV: E=McAfee;i="6800,10657,11626"; a="66261626"
X-IronPort-AV: E=Sophos;i="6.20,234,1758610800"; d="scan'208";a="66261626"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Nov 2025 06:14:36 -0800
X-CSE-ConnectionGUID: NhYAQhxgSxuUkoDKuNoCnw==
X-CSE-MsgGUID: TdC7kSsgSSq1bGFyFZH/og==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,234,1758610800"; d="scan'208";a="224173705"
Received: from lab-ah.igk.intel.com (HELO [127.0.1.1]) ([10.211.135.228])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Nov 2025 06:14:35 -0800
From: Andrzej Hajda <andrzej.hajda@intel.com>
Date: Fri, 28 Nov 2025 15:12:14 +0100
Subject: [PATCH 10/11] tests/intel/xe_eudebug_online: cache thread count value
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251128-pagefault-one-of-many-v1-10-a8377a93da8f@intel.com>
References: <20251128-pagefault-one-of-many-v1-0-a8377a93da8f@intel.com>
In-Reply-To: <20251128-pagefault-one-of-many-v1-0-a8377a93da8f@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>, 
 Priyanka Dandamudi <priyanka.dandamudi@intel.com>, 
 Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>, 
 Jan Maslak <jan.maslak@intel.com>, Andrzej Hajda <andrzej.hajda@intel.com>
X-Mailer: b4 0.15-dev-47773
X-Developer-Signature: v=1; a=openpgp-sha256; l=4567;
 i=andrzej.hajda@intel.com; h=from:subject:message-id;
 bh=rOlkZix2vhlI7V8H7qtfT+ZkP8myyu4jjpjWxN2O99I=;
 b=owEB7QES/pANAwAKASNispPeEP3XAcsmYgBpKa32GGICEscsLyYVP04wh1tTrdt6eIztC7PQq
 yJI29QPPxyJAbMEAAEKAB0WIQT8qEQxNN2/XeF/A00jYrKT3hD91wUCaSmt9gAKCRAjYrKT3hD9
 196hC/9H0/ZTp6uwXm1ZtG92BFq+oyuys7BA0DHQRm7eaPBu/QxKrO9GMVuQWlMoyf8vRI7SGY/
 eHX8/GmPqFdGyDL9Xp35yxlm1R/KM4UOZufRjTCNsndLdJlVJvCe7LBIkzfcAf94F3X304RV7J4
 TWo2xQshcqFHUhCYiblQ3jr6OVcLg/UiZzxXeassKIFI/gmyS/BY++yJ/PUcslkzMRZGpLnxw1t
 sczW2enKJREBvh6DESUn7CCRzoCTx3/qBL4jzBOZSXsCI2F/T2DBolSk2X0VCYg73NuHnVNrkFW
 TBSf6ov9RjbHcoM1WAJUKY5erDnTrb/jPir1hq/pmhwaqRtFao7fnd6jBwkBaxO74MKpZuDb9JV
 NjTKjQgvqXwsChItMIUlzGE9Cp5RaNKJSkbklfIODHg+tfERh99JozgMgDBlgQmC196HFY17adO
 gIFy/NtbnWFOE6WLQ6+vhTJUQIgq0b387dNheVqbH5615IxkavcgJ8DbN8J2eGKj+QtJk=
X-Developer-Key: i=andrzej.hajda@intel.com; a=openpgp;
 fpr=FCA8443134DDBF5DE17F034D2362B293DE10FDD7
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

Instead of recalculation of count of threads every time it is used
we can cache it. While at it one can change it's argument to
online_debug_data - it will allow dynamic calculation of threads number
in the future.

Signed-off-by: Andrzej Hajda <andrzej.hajda@intel.com>
---
 tests/intel/xe_eudebug_online.c | 28 +++++++++++++++-------------
 1 file changed, 15 insertions(+), 13 deletions(-)

diff --git a/tests/intel/xe_eudebug_online.c b/tests/intel/xe_eudebug_online.c
index 911e2d5f52ef..cd833ba37f92 100644
--- a/tests/intel/xe_eudebug_online.c
+++ b/tests/intel/xe_eudebug_online.c
@@ -145,6 +145,7 @@ struct online_debug_data {
 	int drm_fd;
 	struct drm_xe_engine_class_instance hwe;
 	uint64_t flags;
+	int thread_count;
 	/* client out */
 	int thread_hit_count;
 	/* debugger internals */
@@ -168,16 +169,16 @@ struct online_debug_data {
 	int att_event_counter;
 };
 
-static int get_number_of_threads(int fd, uint64_t flags)
+static int get_number_of_threads(struct online_debug_data *data)
 {
-	if (flags & (PAGEFAULT_STRESS_TEST))
-		return get_maximum_number_of_threads(fd);
+	if (data->flags & (PAGEFAULT_STRESS_TEST))
+		return get_maximum_number_of_threads(data->drm_fd);
 
-	if (flags & (SHADER_MIN_THREADS | SHADER_PAGEFAULT))
+	if (data->flags & (SHADER_MIN_THREADS | SHADER_PAGEFAULT))
 		return 16;
 
-	if (flags & (TRIGGER_RESUME_ONE | TRIGGER_RESUME_SINGLE_WALK |
-		     TRIGGER_RESUME_PARALLEL_WALK | SHADER_CACHING_SRAM | SHADER_CACHING_VRAM))
+	if (data->flags & (TRIGGER_RESUME_ONE | TRIGGER_RESUME_SINGLE_WALK |
+	    TRIGGER_RESUME_PARALLEL_WALK | SHADER_CACHING_SRAM | SHADER_CACHING_VRAM))
 		return 32;
 
 	return 512;
@@ -200,8 +201,8 @@ static int caching_get_instruction_count(int fd, uint32_t s_dim__x, int flags)
 
 static struct gpgpu_shader *get_shader(struct online_debug_data *data)
 {
-	struct dim_t w_dim = walker_dimensions(get_number_of_threads(data->drm_fd, data->flags));
-	struct dim_t s_dim = surface_dimensions(get_number_of_threads(data->drm_fd, data->flags));
+	struct dim_t w_dim = walker_dimensions(data->thread_count);
+	struct dim_t s_dim = surface_dimensions(data->thread_count);
 	static struct gpgpu_shader *shader;
 
 	shader = gpgpu_shader_create(data->drm_fd);
@@ -261,7 +262,7 @@ static struct gpgpu_shader *get_shader(struct online_debug_data *data)
 
 static struct gpgpu_shader *get_sip(struct online_debug_data *data)
 {
-	struct dim_t w_dim = walker_dimensions(get_number_of_threads(data->drm_fd, data->flags));
+	struct dim_t w_dim = walker_dimensions(data->thread_count);
 	static struct gpgpu_shader *sip;
 
 	sip = gpgpu_shader_create(data->drm_fd);
@@ -417,6 +418,7 @@ online_debug_data_create(int drm_fd, struct drm_xe_engine_class_instance *hwe, u
 	data->drm_fd = drm_fd;
 	memcpy(&data->hwe, hwe, sizeof(*hwe));
 	data->flags = flags;
+	data->thread_count = get_number_of_threads(data);
 	pthread_mutex_init(&data->mutex, NULL);
 	data->client_handle = -1ULL;
 	data->exec_queue_handle = -1ULL;
@@ -685,7 +687,7 @@ static void eu_attention_resume_trigger(struct xe_eudebug_debugger *d,
 	}
 
 	if (d->flags & (SHADER_LOOP | SHADER_PAGEFAULT)) {
-		uint32_t threads = get_number_of_threads(d->master_fd, d->flags);
+		uint32_t threads = data->thread_count;
 		uint32_t val = STEERING_END_LOOP;
 
 		igt_assert_eq(pwrite(data->vm_fd, &val, sizeof(uint32_t),
@@ -707,7 +709,7 @@ static void eu_attention_resume_single_step_trigger(struct xe_eudebug_debugger *
 {
 	struct drm_xe_eudebug_event_eu_attention *att = (void *) e;
 	struct online_debug_data *data = d->ptr;
-	const int threads = get_number_of_threads(d->fd, d->flags);
+	const int threads = data->thread_count;
 	uint32_t val;
 	size_t sz = sizeof(uint32_t);
 
@@ -932,7 +934,7 @@ static void eu_attention_resume_caching_trigger(struct xe_eudebug_debugger *d,
 {
 	struct drm_xe_eudebug_event_eu_attention *att = (void *)e;
 	struct online_debug_data *data = d->ptr;
-	struct dim_t s_dim = surface_dimensions(get_number_of_threads(d->fd, d->flags));
+	struct dim_t s_dim = surface_dimensions(data->thread_count);
 	uint32_t *kernel_offset = &data->kernel_offset;
 	int *counter = &data->att_event_counter;
 	int val;
@@ -1091,7 +1093,7 @@ static void run_online_client(struct xe_eudebug_client *c)
 
 	fd = xe_eudebug_client_open_driver(c);
 
-	threads = get_number_of_threads(fd, c->flags);
+	threads = data->thread_count;
 	w_dim = walker_dimensions(threads);
 	s_dim = surface_dimensions(threads);
 

-- 
2.43.0

