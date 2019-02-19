Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED30E8928D
 for <igt-dev@lists.freedesktop.org>; Tue, 19 Feb 2019 10:51:49 +0000 (UTC)
From: Arkadiusz Hiler <arkadiusz.hiler@intel.com>
Date: Tue, 19 Feb 2019 12:51:43 +0200
Message-Id: <20190219105143.27824-2-arkadiusz.hiler@intel.com>
In-Reply-To: <20190219105143.27824-1-arkadiusz.hiler@intel.com>
References: <20190219105143.27824-1-arkadiusz.hiler@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 2/2] benchmarks/meson: Stop renaming
 benchmarks
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
Cc: Daniel Vetter <daniel@ffwll.ch>
List-ID: <igt-dev@lists.freedesktop.org>

TWVzb24gMC40Ni4wIGZpeGVzIHRoZSBpc3N1ZSB0aGF0IGZvcmNlZCB1cyB0byBkbyB0aGUgcmVu
YW1pbmcuCgpDYzogRGFuaWVsIFZldHRlciA8ZGFuaWVsQGZmd2xsLmNoPgpDYzogQ2hyaXMgV2ls
c29uIDxjaHJpc0BjaHJpcy13aWxzb24uY28udWs+ClNpZ25lZC1vZmYtYnk6IEFya2FkaXVzeiBI
aWxlciA8YXJrYWRpdXN6LmhpbGVyQGludGVsLmNvbT4KLS0tCiBiZW5jaG1hcmtzL21lc29uLmJ1
aWxkIHwgNiArKy0tLS0KIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDQgZGVsZXRp
b25zKC0pCgpkaWZmIC0tZ2l0IGEvYmVuY2htYXJrcy9tZXNvbi5idWlsZCBiL2JlbmNobWFya3Mv
bWVzb24uYnVpbGQKaW5kZXggYmFmMTI0M2QuLjM5N2YzYjhkIDEwMDY0NAotLS0gYS9iZW5jaG1h
cmtzL21lc29uLmJ1aWxkCisrKyBiL2JlbmNobWFya3MvbWVzb24uYnVpbGQKQEAgLTMwLDE1ICsz
MCwxMyBAQCBlbmRpZgogYmVuY2htYXJrc2RpciA9IGpvaW5fcGF0aHMobGliZXhlY2RpciwgJ2Jl
bmNobWFya3MnKQogCiBmb3JlYWNoIHByb2cgOiBiZW5jaG1hcmtfcHJvZ3MKLQkjIEZJWE1FIG1l
c29uIGRvZXNuJ3QgbGlrZSBiaW5hcmllcyB3aXRoIHRoZSBzYW1lIG5hbWUKLQkjIG1lYW53aGls
ZSBqdXN0IHN1ZmZpeCB3aXRoIF9iZW5jaAotCWV4ZWN1dGFibGUocHJvZyArICdfYmVuY2gnLCBw
cm9nICsgJy5jJywKKwlleGVjdXRhYmxlKHByb2csIHByb2cgKyAnLmMnLAogCQkgICBpbnN0YWxs
IDogdHJ1ZSwKIAkJICAgaW5zdGFsbF9kaXIgOiBiZW5jaG1hcmtzZGlyLAogCQkgICBkZXBlbmRl
bmNpZXMgOiBpZ3RfZGVwcykKIGVuZGZvcmVhY2gKIAotZXhlY3V0YWJsZSgnZ2VtX3dzaW1fYmVu
Y2gnLCAnZ2VtX3dzaW0uYycsCitleGVjdXRhYmxlKCdnZW1fd3NpbScsICdnZW1fd3NpbS5jJywK
IAkgICBpbnN0YWxsIDogdHJ1ZSwKIAkgICBpbnN0YWxsX2RpciA6IGJlbmNobWFya3NkaXIsCiAJ
ICAgZGVwZW5kZW5jaWVzIDogaWd0X2RlcHMgKyBbIGxpYl9pZ3RfcGVyZiBdKQotLSAKMi4yMC4x
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwppZ3QtZGV2
IG1haWxpbmcgbGlzdAppZ3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2lndC1kZXY=
