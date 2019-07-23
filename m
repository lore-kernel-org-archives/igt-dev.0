Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A33506E2A5
 for <igt-dev@lists.freedesktop.org>; Tue, 23 Jul 2019 08:55:55 +0000 (UTC)
From: Chris Wilson <chris@chris-wilson.co.uk>
Date: Tue, 23 Jul 2019 09:55:41 +0100
Message-Id: <20190723085541.16164-1-chris@chris-wilson.co.uk>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] intel-ci: Drop gem_mmap_wc/basic-wc from BAT
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

VGhpcyBpcyBhIHBlcmZvcm1hbmNlIHRlc3QgdG8gaGlnaGxpZ2h0IHNpZ25pZmljYW50IGlzc3Vl
cyBvbiwgZm9yCmV4YW1wbGUsIEJheXRhaWwgd2hlcmUgdXNpbmcgdGhlIEdUVCB3YXMgbXVjaCwg
bXVjaCBzbG93ZXIgdGhhbiBpdCB3YXMKaW50ZW5kZWQgdG8gYmUuIFRoaXMgaXMgbm90IGRlbW9u
c3RyYXRpbmcgYSBkcml2ZXIgaXNzdWUsIGJ1dCBhIEhXIG9uZQphbmQgc28gZG9lcyBub3QgbmVl
ZCB0byBiZSBhIGZvdW5kYXRpb25hbCB0ZXN0IGluIEJBVC4KClNpZ25lZC1vZmYtYnk6IENocmlz
IFdpbHNvbiA8Y2hyaXNAY2hyaXMtd2lsc29uLmNvLnVrPgpDYzogSm9vbmFzIExhaHRpbmVuIDxq
b29uYXMubGFodGluZW5AbGludXguaW50ZWwuY29tPgotLS0KIHRlc3RzL2ludGVsLWNpL2Zhc3Qt
ZmVlZGJhY2sudGVzdGxpc3QgfCAxIC0KIDEgZmlsZSBjaGFuZ2VkLCAxIGRlbGV0aW9uKC0pCgpk
aWZmIC0tZ2l0IGEvdGVzdHMvaW50ZWwtY2kvZmFzdC1mZWVkYmFjay50ZXN0bGlzdCBiL3Rlc3Rz
L2ludGVsLWNpL2Zhc3QtZmVlZGJhY2sudGVzdGxpc3QKaW5kZXggZGNmZDY4YTdiLi40MWJhNGFi
ZjkgMTAwNjQ0Ci0tLSBhL3Rlc3RzL2ludGVsLWNpL2Zhc3QtZmVlZGJhY2sudGVzdGxpc3QKKysr
IGIvdGVzdHMvaW50ZWwtY2kvZmFzdC1mZWVkYmFjay50ZXN0bGlzdApAQCAtODAsNyArODAsNiBA
QCBpZ3RAZ2VtX21tYXBfZ3R0QGJhc2ljLXNtYWxsLWJvLXRpbGVkeAogaWd0QGdlbV9tbWFwX2d0
dEBiYXNpYy1zbWFsbC1iby10aWxlZHkKIGlndEBnZW1fbW1hcF9ndHRAYmFzaWMtc21hbGwtY29w
eQogaWd0QGdlbV9tbWFwX2d0dEBiYXNpYy1zbWFsbC1jb3B5LXh5Ci1pZ3RAZ2VtX21tYXBfZ3R0
QGJhc2ljLXdjCiBpZ3RAZ2VtX21tYXBfZ3R0QGJhc2ljLXdyaXRlCiBpZ3RAZ2VtX21tYXBfZ3R0
QGJhc2ljLXdyaXRlLWNwdS1yZWFkLWd0dAogaWd0QGdlbV9tbWFwX2d0dEBiYXNpYy13cml0ZS1n
dHQKLS0gCjIuMjIuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KaWd0LWRldiBtYWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2
