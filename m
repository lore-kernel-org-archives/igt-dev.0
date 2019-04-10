Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 399A889590
 for <igt-dev@lists.freedesktop.org>; Wed, 10 Apr 2019 22:07:19 +0000 (UTC)
From: =?UTF-8?q?Jos=C3=A9=20Roberto=20de=20Souza?= <jose.souza@intel.com>
Date: Wed, 10 Apr 2019 15:07:12 -0700
Message-Id: <20190410220716.19449-2-jose.souza@intel.com>
In-Reply-To: <20190410220716.19449-1-jose.souza@intel.com>
References: <20190410220716.19449-1-jose.souza@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t v3 2/6] tests/fbcon_fbt: Allow fbcon to bind
 when running this test
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
Cc: Dhinakaran Pandiyan <dhinakaran.pandiyan@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

OWM0MTE0ZWM1ZDg3IChsaWI6IEFsd2F5cyB1bmJpbmQgdGhlIGZiY29uIGFyb3VuZCBpZ3QpIGJy
b2tlCmZiY29uX2ZidCB0ZXN0IGFzIGZiY29uIGlzIG5vdCBhbGxvd2VkIHRvIGJpbmQgd2hlbiBl
eGVjdXRpbmcgYW55IElHVAp0ZXN0LCBzbyBsZXRzIGFsbG93IGl0IGFnYWluIGp1c3QgZm9yIHRo
aXMgdGVzdC4KCkNjOiBQYXVsbyBaYW5vbmkgPHBhdWxvLnIuemFub25pQGludGVsLmNvbT4KQ2M6
IERoaW5ha2FyYW4gUGFuZGl5YW4gPGRoaW5ha2FyYW4ucGFuZGl5YW5AaW50ZWwuY29tPgpDYzog
Um9kcmlnbyBWaXZpIDxyb2RyaWdvLnZpdmlAaW50ZWwuY29tPgpDYzogQ2hyaXMgV2lsc29uIDxj
aHJpc0BjaHJpcy13aWxzb24uY28udWs+ClJldmlld2VkLWJ5OiBNYWFydGVuIExhbmtob3JzdCA8
bWFhcnRlbi5sYW5raG9yc3RAbGludXguaW50ZWwuY29tPgpTaWduZWQtb2ZmLWJ5OiBKb3PDqSBS
b2JlcnRvIGRlIFNvdXphIDxqb3NlLnNvdXphQGludGVsLmNvbT4KLS0tCiB0ZXN0cy9rbXNfZmJj
b25fZmJ0LmMgfCA3ICsrKysrKysKIDEgZmlsZSBjaGFuZ2VkLCA3IGluc2VydGlvbnMoKykKCmRp
ZmYgLS1naXQgYS90ZXN0cy9rbXNfZmJjb25fZmJ0LmMgYi90ZXN0cy9rbXNfZmJjb25fZmJ0LmMK
aW5kZXggYTcxN2UwMDAuLmE5ZDkxODM5IDEwMDY0NAotLS0gYS90ZXN0cy9rbXNfZmJjb25fZmJ0
LmMKKysrIGIvdGVzdHMva21zX2ZiY29uX2ZidC5jCkBAIC0yNiw2ICsyNiw3IEBACiAKICNpbmNs
dWRlICJpZ3QuaCIKICNpbmNsdWRlICJpZ3RfcHNyLmgiCisjaW5jbHVkZSAiaWd0X3N5c2ZzLmgi
CiAjaW5jbHVkZSA8c3lzL3R5cGVzLmg+CiAjaW5jbHVkZSA8c3lzL3N0YXQuaD4KICNpbmNsdWRl
IDxmY250bC5oPgpAQCAtMjc5LDYgKzI4MCwxMiBAQCBzdGF0aWMgdm9pZCBzZXR1cF9lbnZpcm9u
bWVudCh2b2lkKQogCWRybV9mZCA9IGRybV9vcGVuX2RyaXZlcl9tYXN0ZXIoRFJJVkVSX0lOVEVM
KTsKIAlpZ3RfcmVxdWlyZShkcm1fZmQgPj0gMCk7CiAJaWd0X2Fzc2VydChjbG9zZShkcm1fZmQp
ID09IDApOworCisJLyoKKwkgKiBpZ3Rfc3VidGVzdF9pbml0X3BhcnNlX29wdHMoKSBkaXNhYmxl
IHRoZSBmYmNvbiBiaW5kLCBzbyB0byB0ZXN0IGl0CisJICogaXMgbmVjZXNzYXJ5IGVuYWJsZSBp
dCBhZ2FpbgorCSAqLworCWJpbmRfZmJjb24odHJ1ZSk7CiB9CiAKIHN0YXRpYyB2b2lkIHRlYXJk
b3duX2Vudmlyb25tZW50KHZvaWQpCi0tIAoyLjIxLjAKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmlndC1kZXYgbWFpbGluZyBsaXN0CmlndC1kZXZAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4v
bGlzdGluZm8vaWd0LWRldg==
