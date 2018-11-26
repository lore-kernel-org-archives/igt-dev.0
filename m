Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com
 [IPv6:2a00:1450:4864:20::543])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0139789F4F
 for <igt-dev@lists.freedesktop.org>; Mon, 26 Nov 2018 14:36:09 +0000 (UTC)
Received: by mail-ed1-x543.google.com with SMTP id f4so15992263edq.10
 for <igt-dev@lists.freedesktop.org>; Mon, 26 Nov 2018 06:36:09 -0800 (PST)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
Date: Mon, 26 Nov 2018 15:36:02 +0100
Message-Id: <20181126143602.20440-1-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] gitlab-CI: Enbable arm64 test target
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

T3VyIGdpdGxhYiBubyBzdXBwb3J0cyBiaW5mbXQtbWlzYyBydW5uaW5nIG9mIGZvcmdlaW4gYmlu
YXJpZXM6CgpodHRwczovL2dpdGxhYi5mcmVlZGVza3RvcC5vcmcvZnJlZWRlc2t0b3AvZnJlZWRl
c2t0b3AvaXNzdWVzLzkxCgpPbmx5IHRoaW5nIG1pc3NpbmcgaXMgdGhhdCB3ZSBhbHNvIG5lZWQg
dG8gaW5zdGFsbCBxZW11LXVzZXItc3RhdGljLApzaW5jZSBiaW5mbXQtbWlzYyB3YW50cyB0byBy
dW4gdGhhdCBiaW5hcnkgZnJvbSBvdXIgbmFtZXNwYWNlLgoKQmlnIGt1ZG9zIHRvIERhbmllbCBm
b3Igc2V0dGluZyB0aGlzIHVwLgoKRXhhbXBsZSBydW4gb24gbXkgc3R1ZmYgYnJhbmNoOgoKaHR0
cHM6Ly9naXRsYWIuZnJlZWRlc2t0b3Aub3JnL2RhbnZldC9pZ3QtZ3B1LXRvb2xzLy0vam9icy81
MDMwNwoKQ2M6IERhbmllbCBTdG9uZSA8ZGFuaWVsQGZvb2lzaGJhci5vcmc+ClNpZ25lZC1vZmYt
Ynk6IERhbmllbCBWZXR0ZXIgPGRhbmllbC52ZXR0ZXJAaW50ZWwuY29tPgotLS0KIC5naXRsYWIt
Y2kueW1sICAgICAgICAgIHwgMSAtCiBEb2NrZXJmaWxlLmRlYmlhbi1hcm02NCB8IDMgKystCiAy
IGZpbGVzIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1n
aXQgYS8uZ2l0bGFiLWNpLnltbCBiLy5naXRsYWItY2kueW1sCmluZGV4IGU2Yzg4NmEwNmViMS4u
MGU1NWUzMTU3YTY5IDEwMDY0NAotLS0gYS8uZ2l0bGFiLWNpLnltbAorKysgYi8uZ2l0bGFiLWNp
LnltbApAQCAtOTMsNyArOTMsNiBAQCB0ZXN0Om5pbmphLXRlc3Q6CiAgIHNjcmlwdDogbmluamEg
LUMgYnVpbGQgdGVzdAogCiB0ZXN0Om5pbmphLXRlc3QtYXJtNjQ6Ci0gIHdoZW46IG1hbnVhbAog
ICBpbWFnZTogJENJX1JFR0lTVFJZLyRDSV9QUk9KRUNUX1BBVEgvaWd0LWRlYmlhbi1hcm02NDps
YXRlc3QKICAgZGVwZW5kZW5jaWVzOgogICAgIC0gYnVpbGQ6dGVzdHMtZGViaWFuLW1lc29uLWFy
bTY0CmRpZmYgLS1naXQgYS9Eb2NrZXJmaWxlLmRlYmlhbi1hcm02NCBiL0RvY2tlcmZpbGUuZGVi
aWFuLWFybTY0CmluZGV4IDIwYzJlOGIzMDY2My4uZTQ5MDVhMjJkNDZjIDEwMDY0NAotLS0gYS9E
b2NrZXJmaWxlLmRlYmlhbi1hcm02NAorKysgYi9Eb2NrZXJmaWxlLmRlYmlhbi1hcm02NApAQCAt
MzUsNyArMzUsOCBAQCBSVU4gYXB0LWdldCBpbnN0YWxsIC15IFwKIFJVTiBhcHQtZ2V0IGluc3Rh
bGwgLXQgc3RyZXRjaC1iYWNrcG9ydHMgLXkgXAogCQkJCQltZXNvbiBcCiAJCQkJCWxpYmRybS1k
ZXY6YXJtNjQgXAotCQkJCQlxZW11LXVzZXIKKwkJCQkJcWVtdS11c2VyIFwKKwkJCQkJcWVtdS11
c2VyLXN0YXRpYwogCiAjIGF1dG90b29scyBidWlsZCBkZXBzCiBSVU4gYXB0LWdldCBpbnN0YWxs
IC15IFwKLS0gCjIuMTkuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KaWd0LWRldiBtYWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2
Cg==
