Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0767CD5BD0
	for <igt-dev@archiver.kernel.org>; Sat, 30 May 2026 18:36:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 79B63112970;
	Sat, 30 May 2026 18:36:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=emersion.fr header.i=@emersion.fr header.b="Mmlmsteo";
	dkim-atps=neutral
Received: from mail-244102.protonmail.ch (mail-244102.protonmail.ch
 [109.224.244.102])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F86111296F
 for <igt-dev@lists.freedesktop.org>; Sat, 30 May 2026 18:35:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail; t=1780166136; x=1780425336;
 bh=RbyfmpZLu6txtgAUenon3SA97J+7j3WqSNJh3C/WGvA=;
 h=Date:To:From:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
 b=MmlmsteoQMB+bZBDQEawgw5EO6nEGxvYd2ejrZEW4G7IJzMNEuNa+pE5e3FKyM4tb
 RDE3xKUVjhrhpcRDjWZV7jifty0WjgNyCxe5lmIasWTm5kjIyOv/R0XkWC7MkggG27
 Hxopn3wuQvajYPCK8t4pN38RHQ54nafUrfPJxi/Eq8z9Z2D7MxIaOlZq1M2PHec3Qm
 vwR25oRgOaYP3KPcCff2xLYTFKdrCdlTgeeSrayoMuPKeywsIZE6JzvEC6AjQw6O5B
 tmAWWXTnQeNPhhkz9rjPqlYEP9CMVX+fINDeJi/YGr8IClQV4uJsbnJLxQi+LnXaxF
 HNO9SihR4F8fg==
Date: Sat, 30 May 2026 18:35:30 +0000
To: igt-dev@lists.freedesktop.org
From: Simon Ser <contact@emersion.fr>
Subject: [PATCH] tests/kms_vblank: add PAGE_FLIP_EVENT property test
Message-ID: <20260530183521.5562-1-contact@emersion.fr>
Feedback-ID: 1358184:user:proton
X-Pm-Message-ID: 3ec51a00694548753ee236a43a28cb2e8d305a5f
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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

This patch introduces a test for the new PAGE_FLIP_EVENT CRTC
property:
https://lore.kernel.org/dri-devel/20260530171422.4615-1-contact@emersion.fr=
/T/#u

Signed-off-by: Simon Ser <contact@emersion.fr>
---
 lib/igt_kms.c      |  1 +
 lib/igt_kms.h      |  1 +
 tests/kms_vblank.c | 45 +++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 47 insertions(+)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index 0f1ce03a943b..b9f780445448 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -739,6 +739,7 @@ const char * const igt_crtc_prop_names[IGT_NUM_CRTC_PRO=
PS] =3D {
 =09[IGT_CRTC_VRR_ENABLED] =3D "VRR_ENABLED",
 =09[IGT_CRTC_SCALING_FILTER] =3D "SCALING_FILTER",
 =09[IGT_CRTC_SHARPNESS_STRENGTH] =3D "SHARPNESS_STRENGTH",
+=09[IGT_CRTC_PAGE_FLIP_EVENT] =3D "PAGE_FLIP_EVENT",
 };
=20
 const char * const igt_connector_prop_names[IGT_NUM_CONNECTOR_PROPS] =3D {
diff --git a/lib/igt_kms.h b/lib/igt_kms.h
index c2a3099de40f..80f6508f3073 100644
--- a/lib/igt_kms.h
+++ b/lib/igt_kms.h
@@ -166,6 +166,7 @@ enum igt_atomic_crtc_properties {
        IGT_CRTC_VRR_ENABLED,
        IGT_CRTC_SCALING_FILTER,
        IGT_CRTC_SHARPNESS_STRENGTH,
+       IGT_CRTC_PAGE_FLIP_EVENT,
        IGT_NUM_CRTC_PROPS
 };
=20
diff --git a/tests/kms_vblank.c b/tests/kms_vblank.c
index 7fb7de0a70c1..a54db8a54d90 100644
--- a/tests/kms_vblank.c
+++ b/tests/kms_vblank.c
@@ -288,6 +288,30 @@ static void crtc_id_subtest(data_t *data, int fd)
 =09return;
 }
=20
+static void page_flip_event_prop_subtest(data_t *data, int fd) {
+=09igt_display_t *display =3D &data->display;
+=09igt_output_t *output =3D data->output;
+=09igt_crtc_t *crtc =3D data->crtc;
+=09struct drm_event_vblank buf;
+=09igt_plane_t *primary;
+
+=09igt_require(display->is_atomic);
+=09igt_require(igt_crtc_has_prop(crtc, IGT_CRTC_PAGE_FLIP_EVENT));
+
+=09prepare_crtc(data, fd, output);
+
+=09primary =3D igt_output_get_plane(output, 0);
+
+=09igt_plane_set_fb(primary, &data->primary_fb);
+=09igt_crtc_set_prop_value(crtc, IGT_CRTC_PAGE_FLIP_EVENT, 1);
+=09igt_display_commit_atomic(display, 0, NULL);
+
+=09igt_assert_eq(read(fd, &buf, sizeof(buf)), sizeof(buf));
+=09igt_assert_eq(buf.crtc_id, crtc->crtc_id);
+
+=09cleanup_crtc(data, fd, output);
+}
+
 static void accuracy(data_t *data, int fd, int nchildren)
 {
 =09const uint32_t pipe_id_flag =3D igt_crtc_get_vbl_flag(data->crtc);
@@ -692,6 +716,27 @@ int igt_main_args("e", NULL, help_str, opt_handler, NU=
LL)
 =09=09}
 =09}
=20
+=09igt_describe("Check flip events works with the PAGE_FLIP_EVENT atomic p=
roperty.");
+=09igt_subtest_with_dynamic("page-flip-event-prop") {
+=09=09for_each_crtc_with_valid_output(&data.display, crtc,
+=09=09=09=09=09=09data.output) {
+=09=09=09if (!crtc_output_combo_valid(&data.display, crtc, data.output))
+=09=09=09=09continue;
+
+=09=09=09if (!all_pipes && crtc->crtc_index !=3D active_crtcs[0] &&
+=09=09=09=09=09  crtc->crtc_index !=3D active_crtcs[last_crtc_index]) {
+=09=09=09=09igt_info("Skipping pipe %s\n",
+=09=09=09=09=09 igt_crtc_name(crtc));
+=09=09=09=09continue;
+=09=09=09}
+
+=09=09=09data.crtc =3D crtc;
+=09=09=09igt_dynamic_f("pipe-%s-%s", igt_crtc_name(crtc),
+=09=09=09=09      data.output->name)
+=09=09=09=09      page_flip_event_prop_subtest(&data, fd);
+=09=09}
+=09}
+
 =09run_subtests(&data);
=20
 =09igt_fixture() {
--=20
2.54.0


