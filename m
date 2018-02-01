Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mblankhorst.nl (mblankhorst.nl [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 435726EE26
 for <igt-dev@lists.freedesktop.org>; Thu,  1 Feb 2018 15:39:20 +0000 (UTC)
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Date: Thu,  1 Feb 2018 16:39:05 +0100
Message-Id: <20180201153914.74639-1-maarten.lankhorst@linux.intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 0/9] tests: Cleanups and NV12 preparations.
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

U29tZSBjbGVhbnVwcyBhbmQgYWRkaW5nIE5WMTIgc3VwcG9ydCB0byBrbXNfcGxhbmVfc2NhbGlu
Zy4KClRoZSBjbGVhbnVwcyB0byBrbXNfcm90YXRpb25fY3JjIHdpbGwgbWFrZSBpdCBlYXNpZXIg
dG8gdGVzdCBlYWNoIHBpeGVsCmZvcm1hdCBsYXRlciBvbi4KCk1hYXJ0ZW4gTGFua2hvcnN0ICg5
KToKICB0ZXN0cy9rbXNfcGFuZWxfZml0dGluZzogUmVtb3ZlIGRlYWQgY29kZQogIHRlc3RzL2tt
c19hdG9taWM6IEFkZCB0aGUgdGVzdCBmb3IgQ1JUQ19JRC9GQl9JRCBtaXNtYXRjaC4KICB0ZXN0
cy9rbXNfcGxhbmVfc2NhbGluZzogVGVzdCBhbGwgcGl4ZWwgZm9ybWF0cyBpbgogICAgcGlwZS0q
LXNjYWxlci13aXRoLXJvdGF0aW9uCiAgdGVzdHMva21zX3BsYW5lX3NjYWxpbmc6IFRlc3QgYWxs
IHBpeGVsIGZvcm1hdHMgd2l0aCBjbGFtcGluZyBhbmQKICAgIGNsaXBwaW5nIHRvbwogIHRlc3Rz
L2ttc19yb3RhdGlvbl9jcmM6IEZpeCBiYWQtdGlsaW5nIHRlc3RjYXNlLgogIHRlc3RzL2ttc19y
b3RhdGlvbl9jcmM6IE1vdmUgYmFkX2Zvcm1hdCBwYXJhbWV0ZXIgdG8KICAgIHRlc3RfcGxhbmVf
cm90YXRpb24KICB0ZXN0cy9rbXNfcm90YXRpb25fY3JjOiBBbHdheXMgcnVuIHRoZSBmbGlwIHRl
c3RzIHdoZW4gYXZhaWxhYmxlLgogIHRlc3RzL2ttc19yb3RhdGlvbl9jcmM6IFJlbW92ZSBwcmlt
YXJ5LXJvdGF0aW9uLTkwLVktdGlsZWQuCiAgdGVzdHMva21zX3JvdGF0aW9uX2NyYzogUGVyZm9y
bSBsYXp5IGNsZWFudXAgYW5kIHJlcXVpcmUgYXRvbWljLgoKIHRlc3RzL2ttc19hdG9taWMuYyAg
ICAgICAgfCAgIDggKwogdGVzdHMva21zX3BhbmVsX2ZpdHRpbmcuYyB8ICA1MiArKy0tLS0KIHRl
c3RzL2ttc19wbGFuZV9zY2FsaW5nLmMgfCAxMDcgKysrKysrKystLS0tCiB0ZXN0cy9rbXNfcm90
YXRpb25fY3JjLmMgIHwgNDE1ICsrKysrKysrKysrKy0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0KIDQgZmlsZXMgY2hhbmdlZCwgMTk4IGluc2VydGlvbnMoKyksIDM4NCBkZWxldGlv
bnMoLSkKCi0tIAoyLjE1LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmlndC1kZXYgbWFpbGluZyBsaXN0CmlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaWd0LWRl
dgo=
