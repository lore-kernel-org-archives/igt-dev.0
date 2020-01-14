Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B7D8D891FB
 for <igt-dev@lists.freedesktop.org>; Tue, 14 Jan 2020 14:25:28 +0000 (UTC)
From: Ville Syrjala <ville.syrjala@linux.intel.com>
Date: Tue, 14 Jan 2020 16:25:18 +0200
Message-Id: <20200114142523.10603-2-ville.syrjala@linux.intel.com>
In-Reply-To: <20200114142523.10603-1-ville.syrjala@linux.intel.com>
References: <20200114142523.10603-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 2/7] tests/eviction_common: Fix compiler
 warn on 32bit
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
To: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

RnJvbTogVmlsbGUgU3lyasOkbMOkIDx2aWxsZS5zeXJqYWxhQGxpbnV4LmludGVsLmNvbT4KCi4u
L3Rlc3RzL2V2aWN0aW9uX2NvbW1vbi5jOjE0MTozNzogd2FybmluZzogcGFzc2luZyBhcmd1bWVu
dCAxIG9mIOKAmGludGVsX2dldF90b3RhbF9waW5uYWJsZV9tZW3igJkgZnJvbSBpbmNvbXBhdGli
bGUgcG9pbnRlciB0eXBlIFstV2luY29tcGF0aWJsZS1wb2ludGVyLXR5cGVzXQouLi9saWIvaWd0
X2F1eC5oOjIwNjo3OiBub3RlOiBleHBlY3RlZCDigJhzaXplX3QgKuKAmSB7YWthIOKAmHVuc2ln
bmVkIGludCAq4oCZfSBidXQgYXJndW1lbnQgaXMgb2YgdHlwZSDigJh1aW50NjRfdCAq4oCZIHth
a2Eg4oCYbG9uZyBsb25nIHVuc2lnbmVkIGludCAq4oCZfQoKU2lnbmVkLW9mZi1ieTogVmlsbGUg
U3lyasOkbMOkIDx2aWxsZS5zeXJqYWxhQGxpbnV4LmludGVsLmNvbT4KLS0tCiB0ZXN0cy9ldmlj
dGlvbl9jb21tb24uYyB8IDQgKystLQogMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwg
MiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS90ZXN0cy9ldmljdGlvbl9jb21tb24uYyBiL3Rl
c3RzL2V2aWN0aW9uX2NvbW1vbi5jCmluZGV4IGEzYjllNDE2N2EwYi4uODQ0NmM0MjFiNDE2IDEw
MDY0NAotLS0gYS90ZXN0cy9ldmljdGlvbl9jb21tb24uYworKysgYi90ZXN0cy9ldmljdGlvbl9j
b21tb24uYwpAQCAtMzAsNyArMzAsNiBAQAogI2luY2x1ZGUgImlndC5oIgogI2luY2x1ZGUgPHN0
ZGxpYi5oPgogCi0KIHN0cnVjdCBpZ3RfZXZpY3Rpb25fdGVzdF9vcHMgewogCXVpbnQzMl90ICgq
Y3JlYXRlKShpbnQgZmQsIHVpbnQ2NF90IHNpemUpOwogCXZvaWQgKCpmbGluaykodWludDMyX3Qg
b2xkX2hhbmRsZSwgdWludDMyX3QgbmV3X2hhbmRsZSk7CkBAIC0xMzMsNyArMTMyLDggQEAgc3Rh
dGljIHZvaWQgbWxvY2tlZF9ldmljdGlvbnMoaW50IGZkLCBzdHJ1Y3QgaWd0X2V2aWN0aW9uX3Rl
c3Rfb3BzICpvcHMsCiAJCQkgICAgICB1aW50NjRfdCBzdXJmYWNlX3NpemUsCiAJCQkgICAgICB1
aW50NjRfdCBzdXJmYWNlX2NvdW50KQogewotCXVpbnQ2NF90IHN6LCBwaW4sIHRvdGFsOworCXVp
bnQ2NF90IHN6LCBwaW47CisJc2l6ZV90IHRvdGFsOwogCXZvaWQgKm1lbTsKIAogCWludGVsX3Jl
cXVpcmVfbWVtb3J5KHN1cmZhY2VfY291bnQsIHN1cmZhY2Vfc2l6ZSwgQ0hFQ0tfUkFNKTsKLS0g
CjIuMjQuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
aWd0LWRldiBtYWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6
Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2Cg==
