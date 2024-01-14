Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-4321.protonmail.ch (mail-4321.protonmail.ch [185.70.43.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5422D10E1D4
 for <igt-dev@lists.freedesktop.org>; Sun, 14 Jan 2024 21:34:44 +0000 (UTC)
Date: Sun, 14 Jan 2024 21:26:36 +0000
To: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
From: anonymoustranquillity@proton.me
Subject: [PATCH i-g-t] tools/intel_gpu_top: Fix misaligned rendering
Message-ID: <cPSpR9MXRhQ1yFaJm1l9QDoVT9SiH_resuKtBB52HnpHOiI5AO2BPTNYg3Srfj_vaU8_u-cSp5u7luqyAUta-9p8EjyIGKhizxL4hCwMNpY=@proton.me>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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

Hello,=20

there seems to be a problem with rendering in the interactive mode in intel=
_gpu_top, seems to be a simple off-by-one. Below is a patch. I am new to co=
ntributing via email, so I apologize if I did something wrong - I tried to =
follow CONTRIBUTING.md to the best of my ability.

Have a nice day,
- Ity.

---
 tools/intel_gpu_top.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/intel_gpu_top.c b/tools/intel_gpu_top.c
index 046ead15a..24363e72f 100644
--- a/tools/intel_gpu_top.c
+++ b/tools/intel_gpu_top.c
@@ -2178,7 +2178,7 @@ print_client(struct igt_drm_client *c, struct engines=
 *engines, double t, int li
 =09=09=09len +=3D *class_w;
 =09=09}
=20
-=09=09printf(" %-*s\n", con_w - len - 1, c->print_name);
+=09=09printf(" %-*s\n", con_w - len - 2, c->print_name);
 =09} else if (output_mode =3D=3D JSON) {
 =09=09char buf[64];
=20
--=20
2.43.0
