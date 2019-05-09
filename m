Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9298489A62
 for <igt-dev@lists.freedesktop.org>; Thu,  9 May 2019 10:03:47 +0000 (UTC)
From: Arkadiusz Hiler <arkadiusz.hiler@intel.com>
Date: Thu,  9 May 2019 13:03:26 +0300
Message-Id: <20190509100326.29224-5-arkadiusz.hiler@intel.com>
In-Reply-To: <20190509100326.29224-1-arkadiusz.hiler@intel.com>
References: <20190509100326.29224-1-arkadiusz.hiler@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 5/5] meson: Use -D_FORTIFY_SOURCE=2 on
 optimized builds
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
Cc: Eero Tamminen <eero.t.tamminen@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

U29tZSBkaXN0cmlidXRpb24gZW5hYmxlIF9GT1JUSUZZX1NPVVJDRSBpbXBsaWNpdGx5IGlmIHVz
ZXIgc2V0cyBvZiAtTzEKZ3JlYXRlciBpbiB0aGUgQ0ZMQUdTLCB3aGljaCBtYXkgY2F1c2Ugc3Vy
cHJpc2UgY29tcGlsZSBmYWlsdXJlcy4KCkxldCdzIGZvcnRpZnkgZXhwbGljaXRseSBhbmQgZm9y
IGV2ZXJ5b25lIHdpdGggZGVmYXVsdCBidWlsZCwgc2luY2UgdGhlCmNoZWNrcyBwcm92aWRlZCBh
cmUgZ29vZC4KCkNjOiBFZXJvIFRhbW1pbmVuIDxlZXJvLnQudGFtbWluZW5AaW50ZWwuY29tPgpT
aWduZWQtb2ZmLWJ5OiBBcmthZGl1c3ogSGlsZXIgPGFya2FkaXVzei5oaWxlckBpbnRlbC5jb20+
Ci0tLQogbWVzb24uYnVpbGQgfCA3ICsrKysrKysKIDEgZmlsZSBjaGFuZ2VkLCA3IGluc2VydGlv
bnMoKykKCmRpZmYgLS1naXQgYS9tZXNvbi5idWlsZCBiL21lc29uLmJ1aWxkCmluZGV4IDJhNWE4
NTgwLi4yZDFmNWM1MCAxMDA2NDQKLS0tIGEvbWVzb24uYnVpbGQKKysrIGIvbWVzb24uYnVpbGQK
QEAgLTI1NSw2ICsyNTUsMTMgQEAgY29uZmlnLnNldDEwKCdIQVZFX01FTUZEX0NSRUFURScsIGhh
dmUpCiBhZGRfcHJvamVjdF9hcmd1bWVudHMoJy1EX0dOVV9TT1VSQ0UnLCBsYW5ndWFnZSA6ICdj
JykKIGFkZF9wcm9qZWN0X2FyZ3VtZW50cygnLWluY2x1ZGUnLCAnY29uZmlnLmgnLCBsYW5ndWFn
ZSA6ICdjJykKIAorIyBGRUFUVVJFX1RFU1RfTUFDUk9TKDcpCisjIHBlcmZvcm1zIGxpZ2h0d2Vp
Z2h0IG92ZXJmbG93IGNoZWNrcyBvbiBxdWl0ZSBhIGZldyBsaWJjIGZ1bmN0aW9ucworIyByZXF1
aXJlcyAtTyBvcHRpbWl6YXRpb25zCitpZiAgWydkZWJ1Z29wdGltaXplZCcsICdyZWxlYXNlJywg
J21pbnNpemUnXS5jb250YWlucyhnZXRfb3B0aW9uKCdidWlsZHR5cGUnKSkKKwlhZGRfcHJvamVj
dF9hcmd1bWVudHMoJy1EX0ZPUlRJRllfU09VUkNFPTInLCBsYW5ndWFnZSA6ICdjJykKK2VuZGlm
CisKIGNvbmZpZy5zZXQoJ1BBQ0tBR0VfTkFNRScsIG1lc29uLnByb2plY3RfbmFtZSgpKQogY29u
ZmlnLnNldF9xdW90ZWQoJ1BBQ0tBR0VfVkVSU0lPTicsIG1lc29uLnByb2plY3RfdmVyc2lvbigp
KQogY29uZmlnLnNldF9xdW90ZWQoJ1BBQ0tBR0UnLCBtZXNvbi5wcm9qZWN0X25hbWUoKSkKLS0g
CjIuMjAuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
aWd0LWRldiBtYWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6
Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2
