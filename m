Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com
 [IPv6:2a00:1450:4864:20::541])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C6E416E1D1
 for <igt-dev@lists.freedesktop.org>; Thu, 28 Feb 2019 14:49:18 +0000 (UTC)
Received: by mail-ed1-x541.google.com with SMTP id m12so17202508edv.4
 for <igt-dev@lists.freedesktop.org>; Thu, 28 Feb 2019 06:49:18 -0800 (PST)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
Date: Thu, 28 Feb 2019 15:49:03 +0100
Message-Id: <20190228144910.26488-1-daniel.vetter@ffwll.ch>
Subject: [igt-dev] [PATCH 0/7] some cleanups and uapi clarification for
 leases
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: DRI Development <dri-devel@lists.freedesktop.org>
Cc: IGT development <igt-dev@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

SGkgYWxsLAoKTm90aGluZyB0b28gbWFqb3IsIG9ubHkgdGhpbmdzIEkgZGlkIGZpbmQgaW4gYWxs
IG15IGlndCB0ZXN0IGV4dGVuZGluZyBmb3IKZHJtIGxlYXNlIGlzIHNvbWUgY29ybmVyIGNhc2Vz
IGFyb3VuZCBpbXBsaWNpdCBwbGFuZXMgYW5kIGF0b21pYyB0YXJnZXQKY3J0Y3MuIFJldmlldyBh
bmQgY29tbWVudHMgdmVyeSBtdWNoIGFwcHJlY2lhdGVkLgoKQ2hlZXJzLCBEYW5pZWwKClRlc3Qt
d2l0aDogMjAxOTAyMjgxNDE5MTguMjYwNDMtMS1kYW5pZWwudmV0dGVyQGZmd2xsLmNoCgpEYW5p
ZWwgVmV0dGVyICg3KToKICBkcm0vbGVhc2VzOiBEcm9wIG9iamVjdF9pZCB2YWxpZGF0aW9uIGZv
ciBuZWdhdGl2ZSBpZHMKICBkcm0vbGVhc2U6IERyb3AgcmVjdXJzaXZlIGxlYWRzIGNoZWNrcwog
IGRybS9sZWFzZXM6IERvbid0IGluaXQgdG8gMCBpbiBkcm1fbWFzdGVyX2NyZWF0ZQogIGRybS9s
ZWFzZTogQ2hlY2sgZm9yIGxlc3NvciBvdXRzaWRlIG9mIGxvY2tzCiAgZHJtL2xlYXNlOiBNYWtl
IHN1cmUgaW1wbGljaXQgcGxhbmVzIGFyZSBsZWFzZWQKICBkcm0vYXRvbWljOiBXaXJlIGZpbGVf
cHJpdiB0aHJvdWdoIGZvciBwcm9wZXJ0eSBjaGFuZ2VzCiAgZHJtL2F0b21pYzogLUVBQ0NFU1Mg
Zm9yIGxlYXNlLWRlbmllZCBjcnRjIGxvb2t1cAoKIGRyaXZlcnMvZ3B1L2RybS9kcm1fYXRvbWlj
X3VhcGkuYyAgIHwgMzYgKysrKysrKysrKysrKysrKysrKysrKystLS0tLS0tLS0tLS0tCiBkcml2
ZXJzL2dwdS9kcm0vZHJtX2F1dGguYyAgICAgICAgICB8ICAyIC0tCiBkcml2ZXJzL2dwdS9kcm0v
ZHJtX2NydGMuYyAgICAgICAgICB8ICA0ICsrKysKIGRyaXZlcnMvZ3B1L2RybS9kcm1fY3J0Y19p
bnRlcm5hbC5oIHwgIDEgKwogZHJpdmVycy9ncHUvZHJtL2RybV9sZWFzZS5jICAgICAgICAgfCAx
MyArKystLS0tLS0tLS0tCiBkcml2ZXJzL2dwdS9kcm0vZHJtX21vZGVfb2JqZWN0LmMgICB8ICA1
ICsrKy0tCiBkcml2ZXJzL2dwdS9kcm0vZHJtX3BsYW5lLmMgICAgICAgICB8ICA4ICsrKysrKysr
CiA3IGZpbGVzIGNoYW5nZWQsIDQyIGluc2VydGlvbnMoKyksIDI3IGRlbGV0aW9ucygtKQoKLS0g
CjIuMTQuNAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
aWd0LWRldiBtYWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6
Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2
