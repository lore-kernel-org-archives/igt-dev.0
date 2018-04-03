Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from b-painless.mh.aa.net.uk (b-painless.mh.aa.net.uk [81.187.30.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 612F16E5E8
 for <igt-dev@lists.freedesktop.org>; Tue,  3 Apr 2018 23:28:24 +0000 (UTC)
Received: from cartman.offog.org ([2001:8b0:83b:b53f::a])
 by b-painless.mh.aa.net.uk with esmtps
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <ats@offog.org>) id 1f3Uje-0003r0-9b
 for igt-dev@lists.freedesktop.org; Tue, 03 Apr 2018 23:49:02 +0100
From: Adam Sampson <ats@offog.org>
Date: Tue,  3 Apr 2018 23:48:43 +0100
Message-Id: <20180403224844.10146-1-ats@offog.org>
Subject: [igt-dev] [PATCH i-g-t 1/2] Use flex -i when building with meson.
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
To: Development mailing list for IGT GPU Tools <igt-dev@lists.freedesktop.org>
Cc: Adam Sampson <ats@offog.org>
List-ID: <igt-dev@lists.freedesktop.org>

V2hlbiBidWlsdCB3aXRoIGF1dG9tYWtlLCB0aGUgYXNzZW1ibGVyJ3MgdG9rZW5pc2VyIGlzIGJ1
aWx0IHdpdGggLWksCm1ha2luZyBpdCBjYXNlLWluc2Vuc2l0aXZlLiBUaGlzIHdhc24ndCBiZWlu
ZyBkb25lIHdpdGggbWVzb24uCgooVGhlIHN5bXB0b20gd2FzIGJ1aWxkIGZhaWx1cmVzIGluIGlu
dGVsLXZhYXBpLWRyaXZlciwgd2hpY2ggdXNlcwpyZWdpc3RlciB0eXBlcyBsaWtlICI6dWIiLiBJ
biBsZXgubCwgdGhleSdyZSB3cml0dGVuIGFzICI6VUIiLCBzbyB0aGUKbGV4ZXIgd2FzIHJlamVj
dGluZyB0aGVtIHdpdGhvdXQgLWkuKQoKU2lnbmVkLW9mZi1ieTogQWRhbSBTYW1wc29uIDxhdHNA
b2Zmb2cub3JnPgotLS0KIGFzc2VtYmxlci9tZXNvbi5idWlsZCB8IDIgKy0KIDEgZmlsZSBjaGFu
Z2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2Fzc2VtYmxl
ci9tZXNvbi5idWlsZCBiL2Fzc2VtYmxlci9tZXNvbi5idWlsZAppbmRleCA3NTE3ZDgyZi4uYzg1
OGJjMGYgMTAwNjQ0Ci0tLSBhL2Fzc2VtYmxlci9tZXNvbi5idWlsZAorKysgYi9hc3NlbWJsZXIv
bWVzb24uYnVpbGQKQEAgLTE5LDcgKzE5LDcgQEAgYmlzb24gPSBmaW5kX3Byb2dyYW0oJ2Jpc29u
JykKIAogbGdlbiA9IGdlbmVyYXRvcihmbGV4LAogCQlvdXRwdXQgOiAnQEJBU0VOQU1FQC5jJywK
LQkJYXJndW1lbnRzIDogWyctbycsICdAT1VUUFVUQCcsICdASU5QVVRAJ10pCisJCWFyZ3VtZW50
cyA6IFsnLWknLCAnLW8nLCAnQE9VVFBVVEAnLCAnQElOUFVUQCddKQogCiBsZmlsZXMgPSBsZ2Vu
LnByb2Nlc3MoJ2xleC5sJykKIAotLSAKMi4xNy4wCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwppZ3QtZGV2IG1haWxpbmcgbGlzdAppZ3QtZGV2QGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2lndC1kZXYK
