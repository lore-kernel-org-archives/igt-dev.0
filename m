Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com
 [IPv6:2a00:1450:4864:20::543])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE9ED6EC59
 for <igt-dev@lists.freedesktop.org>; Thu,  7 Feb 2019 14:58:25 +0000 (UTC)
Received: by mail-ed1-x543.google.com with SMTP id a2so134600edi.0
 for <igt-dev@lists.freedesktop.org>; Thu, 07 Feb 2019 06:58:25 -0800 (PST)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
Date: Thu,  7 Feb 2019 15:57:06 +0100
Message-Id: <20190207145707.27623-3-daniel.vetter@ffwll.ch>
In-Reply-To: <20190207145707.27623-1-daniel.vetter@ffwll.ch>
References: <20190207145707.27623-1-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 3/4] lib: Don't leak children in
 igt_waitchildren_timeout
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

SW5zdGVhZCBvZiBjbGVhbmluZyB1cCB0aGUgbWVzcyBpbiBpZ3RfZXhpdCBtYWtlIHN1cmUgd2Ug
ZG9uJ3QgZXZlbgpsZXQgaXQgb3V0IG9mIHRoZSBjb250YWluZXIuIFNlZSBhbHNvCgpjb21taXQg
NzU0ODc2Mzc4ZDZjOWIyNzc1ZThjMDdiNGQxNmY5ODc4YzU1OTQ5ZgpBdXRob3I6IENocmlzIFdp
bHNvbiA8Y2hyaXNAY2hyaXMtd2lsc29uLmNvLnVrPgpEYXRlOiAgIEZyaSBGZWIgMjYgMjI6MTE6
MTAgMjAxNiArMDAwMAoKICAgIGlndC9nZW1fc3luYzogRW5mb3JjZSBhIHRpbWVvdXQgb2YgMjBz
Cgp3aGljaCBhZGRlZCB0aGlzIGhlbHBlci4KClRvIG1ha2Ugc3VyZSB0aGF0IGV2ZXJ5b25lIGZv
bGxvd3MgdGhlIHJ1bGVzLCBhZGQgYW4gYXNzZXJ0LgoKV2UncmUga2VlcGluZyB0aGUgY2xlYW51
cCBjb2RlIGFzIGEgZmFpbHNhZmUsIGFuZCBiZWNhdXNlIGl0IHNwZWVkcwp1cCB0aGUgdGVzdGNh
c2UgSSdtIGZvbGxvd2luZyB1cCB3aXRoLgoKQ2M6IENocmlzIFdpbHNvbiA8Y2hyaXNAY2hyaXMt
d2lsc29uLmNvLnVrPgpTaWduZWQtb2ZmLWJ5OiBEYW5pZWwgVmV0dGVyIDxkYW5pZWwudmV0dGVy
QGludGVsLmNvbT4KLS0tCiBsaWIvaWd0X2NvcmUuYyB8IDYgKysrKysrCiAxIGZpbGUgY2hhbmdl
ZCwgNiBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvbGliL2lndF9jb3JlLmMgYi9saWIvaWd0
X2NvcmUuYwppbmRleCA0OWZiZjcwZGViMDYuLmE3MTA1ZjA1OTFmYyAxMDA2NDQKLS0tIGEvbGli
L2lndF9jb3JlLmMKKysrIGIvbGliL2lndF9jb3JlLmMKQEAgLTE1MjUsNiArMTUyNSw3IEBAIHZv
aWQgaWd0X2V4aXQodm9pZCkKIAogCWZvciAoaW50IGMgPSAwOyBjIDwgbnVtX3Rlc3RfY2hpbGRy
ZW47IGMrKykKIAkJa2lsbCh0ZXN0X2NoaWxkcmVuW2NdLCBTSUdLSUxMKTsKKwlhc3NlcnQoIW51
bV90ZXN0X2NoaWxkcmVuKTsKIAogCWlmICghdGVzdF93aXRoX3N1YnRlc3RzKSB7CiAJCXN0cnVj
dCB0aW1lc3BlYyBub3c7CkBAIC0xODQyLDYgKzE4NDMsMTEgQEAgdm9pZCBpZ3Rfd2FpdGNoaWxk
cmVuX3RpbWVvdXQoaW50IHNlY29uZHMsIGNvbnN0IGNoYXIgKnJlYXNvbikKIAlpZ3Rfc2V0X3Rp
bWVvdXQoc2Vjb25kcywgcmVhc29uKTsKIAlpZ3Rfd2FpdGNoaWxkcmVuKCk7CiAJaWd0X3Jlc2V0
X3RpbWVvdXQoKTsKKworCWZvciAoaW50IGMgPSAwOyBjIDwgbnVtX3Rlc3RfY2hpbGRyZW47IGMr
KykKKwkJa2lsbCh0ZXN0X2NoaWxkcmVuW2NdLCBTSUdLSUxMKTsKKworCV9faWd0X3dhaXRjaGls
ZHJlbigpOwogfQogCiAvKiBleGl0IGhhbmRsZXIgY29kZSAqLwotLSAKMi4yMC4xCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwppZ3QtZGV2IG1haWxpbmcg
bGlzdAppZ3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2lndC1kZXYK
