Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com
 [IPv6:2a00:1450:4864:20::543])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F3F3F6E366
 for <igt-dev@lists.freedesktop.org>; Wed,  5 Dec 2018 08:08:21 +0000 (UTC)
Received: by mail-ed1-x543.google.com with SMTP id p6so7941294eds.0
 for <igt-dev@lists.freedesktop.org>; Wed, 05 Dec 2018 00:08:21 -0800 (PST)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
Date: Wed,  5 Dec 2018 09:08:14 +0100
Message-Id: <20181205080814.474-1-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] gitlab-ci: Always set PKG_CONFIG_PATH
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: IGT development <igt-dev@lists.freedesktop.org>
Cc: Daniel Vetter <daniel.vetter@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

bWVzb24gZ2V0cyBncnVtcHkgaWYgdGhhdCBjaGFuZ2VzIGJldHdlZW4gaW52b2NhdGlvbnMuCgpJ
J20gbm90IGVudGlyZWx5IGNsZWFyIG9uIHdoeSB0aGlzIGhhcHBlbnMgd2l0aCB0aGUgaW50ZXJp
bSBydW5uZXIKZnJvbSBnbm9tZSBmb2xrcywgYnV0IGl0IGRvZXMuIFdlIGRvIHN0aWxsIHJ1biB0
aGUgZXhhY3Qgc2FtZSBpbWFnZSwKd2l0aCB0aGUgZXhhY3Qgc2FtZSBtZXNvbiB2ZXJzaW9uLiBC
dXQgc29tZW9uZSB0aGUgb2xkIHJ1bm5lciBkaWRuJ3QKY29tcGxhaW4sIHdoaWxlIHRoZSBuZXcg
b25lIGRvZXMuCgpOb3RlIHRoYXQgdGhlIGpvYnMgc3RpbGwgZmFpbCBiZWNhdXNlIHRoZSBpbnRl
cmltIHJ1bm5lciBpcyBkZWFkIHNsb3cKKDEweC0xMDB4IHNsb3dlciB0byBydW4gdGhlIGxpYnJh
cnkgdGVzdHMpIGFuZCB0aW1lcyBvdXQgYWZ0ZXIgMzBzIG9uCnRlc3RzIHRoYXQgdGFrZSAxcyBt
YXguCgpTaWduZWQtb2ZmLWJ5OiBEYW5pZWwgVmV0dGVyIDxkYW5pZWwudmV0dGVyQGludGVsLmNv
bT4KLS0tCiAuZ2l0bGFiLWNpLnltbCB8IDQgKysrLQogMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0
aW9ucygrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhLy5naXRsYWItY2kueW1sIGIvLmdp
dGxhYi1jaS55bWwKaW5kZXggNWNiYjQyODc1MjNlLi44MDg3YmQzOThmM2QgMTAwNjQ0Ci0tLSBh
Ly5naXRsYWItY2kueW1sCisrKyBiLy5naXRsYWItY2kueW1sCkBAIC02MSw3ICs2MSw4IEBAIGJ1
aWxkOnRlc3RzLWRlYmlhbi1tZXNvbi1hcm02NDoKICAgaW1hZ2U6ICRDSV9SRUdJU1RSWS8kQ0lf
UFJPSkVDVF9QQVRIL2lndC1kZWJpYW4tYXJtNjQ6bGF0ZXN0CiAgIHN0YWdlOiBidWlsZAogICBz
Y3JpcHQ6Ci0gICAgLSBQS0dfQ09ORklHX1BBVEg9L3Vzci9saWIvYWFyY2g2NC1saW51eC1nbnUv
cGtnY29uZmlnLyBtZXNvbiAtLWNyb3NzLWZpbGUgbWVzb24tY3Jvc3MtYXJtNjQudHh0IGJ1aWxk
CisgICAgLSBleHBvcnQgUEtHX0NPTkZJR19QQVRIPS91c3IvbGliL2FhcmNoNjQtbGludXgtZ251
L3BrZ2NvbmZpZy8KKyAgICAtIG1lc29uIC0tY3Jvc3MtZmlsZSBtZXNvbi1jcm9zcy1hcm02NC50
eHQgYnVpbGQKICAgICAtIG5pbmphIC1DIGJ1aWxkCiAgIGFydGlmYWN0czoKICAgICBwYXRoczoK
QEAgLTkyLDYgKzkzLDcgQEAgdGVzdDpuaW5qYS10ZXN0LWFybTY0OgogICAgIC0gYnVpbGQ6dGVz
dHMtZGViaWFuLW1lc29uLWFybTY0CiAgIHN0YWdlOiB0ZXN0CiAgIHNjcmlwdDoKKyAgICAtIGV4
cG9ydCBQS0dfQ09ORklHX1BBVEg9L3Vzci9saWIvYWFyY2g2NC1saW51eC1nbnUvcGtnY29uZmln
LwogICAgIC0gZW52ID4gYnVpbGQvZW52ZHVtcC50eHQKICAgICAtIG5pbmphIC1DIGJ1aWxkIHRl
c3QKICAgYXJ0aWZhY3RzOgotLSAKMi4yMC4wLnJjMQoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBtYWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9pZ3QtZGV2Cg==
