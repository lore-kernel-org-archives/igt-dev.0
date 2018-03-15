Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mblankhorst.nl (mblankhorst.nl
 [IPv6:2a02:2308::216:3eff:fe92:dfa3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E8A546E822
 for <igt-dev@lists.freedesktop.org>; Thu, 15 Mar 2018 11:01:06 +0000 (UTC)
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Date: Thu, 15 Mar 2018 12:01:04 +0100
Message-Id: <20180315110104.72199-1-maarten.lankhorst@linux.intel.com>
Subject: [igt-dev] [PATCH i-g-t] lib/igt_kms: Fix enum type in
 igt_pipe_has_prop.
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
To: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

Rm91bmQgd2hlbiBjb21waWxpbmcgaWd0IHdpdGggY2xhbmc6ClsyODQvODE5XSBDb21waWxpbmcg
QyBvYmplY3QgJ3Rlc3RzL2ttc19jcnRjX2JhY2tncm91bmRfY29sb3JAZXhlL2ttc19jcnRjX2Jh
Y2tncm91bmRfY29sb3IuYy5vJy4KLi4vdGVzdHMva21zX2NydGNfYmFja2dyb3VuZF9jb2xvci5j
OjE0MDo0ODogd2FybmluZzogaW1wbGljaXQgY29udmVyc2lvbiBmcm9tIGVudW1lcmF0aW9uIHR5
cGUKCSdlbnVtIGlndF9hdG9taWNfY3J0Y19wcm9wZXJ0aWVzJyB0byBkaWZmZXJlbnQgZW51bWVy
YXRpb24gdHlwZSAnZW51bSBpZ3RfYXRvbWljX2Nvbm5lY3Rvcl9wcm9wZXJ0aWVzJyBbLVdlbnVt
LWNvbnZlcnNpb25dCgpTaWduZWQtb2ZmLWJ5OiBNYWFydGVuIExhbmtob3JzdCA8bWFhcnRlbi5s
YW5raG9yc3RAbGludXguaW50ZWwuY29tPgotLS0KIGxpYi9pZ3Rfa21zLmggfCAyICstCiAxIGZp
bGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9s
aWIvaWd0X2ttcy5oIGIvbGliL2lndF9rbXMuaAppbmRleCAxYzQ2MTg2ZThhOWQuLjY3MjkzMGU5
ODQ5ZiAxMDA2NDQKLS0tIGEvbGliL2lndF9rbXMuaAorKysgYi9saWIvaWd0X2ttcy5oCkBAIC02
MTUsNyArNjE1LDcgQEAgaWd0X3BpcGVfZ2V0X3Byb3AoaWd0X2Rpc3BsYXlfdCAqZGlzcGxheSwg
ZW51bSBwaXBlIHBpcGUsCiAgKi8KIHN0YXRpYyBpbmxpbmUgYm9vbAogaWd0X3BpcGVfaGFzX3By
b3AoaWd0X2Rpc3BsYXlfdCAqZGlzcGxheSwgZW51bSBwaXBlIHBpcGUsCi0JCSAgZW51bSBpZ3Rf
YXRvbWljX2Nvbm5lY3Rvcl9wcm9wZXJ0aWVzIHByb3ApCisJCSAgZW51bSBpZ3RfYXRvbWljX2Ny
dGNfcHJvcGVydGllcyBwcm9wKQogewogCXJldHVybiBkaXNwbGF5LT5waXBlc1twaXBlXS5wcm9w
c1twcm9wXTsKIH0KLS0gCjIuMTYuMgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KaWd0LWRldiBtYWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9p
Z3QtZGV2Cg==
