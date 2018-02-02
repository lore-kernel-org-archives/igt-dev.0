Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-wr0-x235.google.com (mail-wr0-x235.google.com
 [IPv6:2a00:1450:400c:c0c::235])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 556546EE48
 for <igt-dev@lists.freedesktop.org>; Fri,  2 Feb 2018 18:38:05 +0000 (UTC)
Received: by mail-wr0-x235.google.com with SMTP id g21so23433733wrb.13
 for <igt-dev@lists.freedesktop.org>; Fri, 02 Feb 2018 10:38:05 -0800 (PST)
From: Tvrtko Ursulin <tursulin@ursulin.net>
Date: Fri,  2 Feb 2018 18:37:45 +0000
Message-Id: <20180202183754.30042-1-tvrtko.ursulin@linux.intel.com>
Subject: [igt-dev] [PATCH v2 i-g-t 0/9] perf_pmu reliability improvements
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

RnJvbTogVHZydGtvIFVyc3VsaW4gPHR2cnRrby51cnN1bGluQGludGVsLmNvbT4KClNvbWUgcmV3
b3JrcyB0byBob3BlZnVsbHkgaW1wcm92ZSB0aGUgcmVsaWFiaWxpdHkgb2YgdGVzdHMgb24gc21h
bGwgY29yZQptYWNoaW5lcy4KCk1vc3RseSBlbnN1cmluZyBtZWFzdXJlZCBzbGVlcCBhcHByb2Fj
aCBpcyBhbHdheXMgdXNlZCBpbiB0ZXN0cyB3aGljaCBsb29rIGF0CnRpbWUsIGFuZCB0aGF0IHRp
bWUgc3BlbnQgc2V0dGluZyB1cCB0aGUgdGVzdCBpcyBpZ25vcmVkIGFzIG11Y2ggYXMgcG9zc2li
bGUuCgp2MjoKCk1vcmUgdGVzdHMgYW5kIG1vcmUgZml4ZXMsIG1vc3Qgbm90YWJseSB0ZXN0IGZv
ciB0aGUgUE1VIGVuYWJsZSB2cyBleGVjbGlzdHMKdGFza2xldCByYWNlIGFuZCBDUFUgaG90cGx1
ZyB0ZXN0IGZpeCBmb3IgdHJpZ2dlciBoYXBweSBoYW5nY2hlY2suCgpUdnJ0a28gVXJzdWxpbiAo
OSk6CiAgdGVzdHMvcGVyZl9wbXU6IFRpZ2h0ZW4gYnVzeSBtZWFzdXJlbWVudAogIHRlc3RzL3Bl
cmZfcG11OiBNb3JlIGJ1c3kgbWVhc3VyZW1lbnQgdGlnaHRlbmluZwogIHRlc3RzL3BlcmZfcG11
OiBVc2UgbWVhc3VyZWQgc2xlZXAgaW4gYWxsIHRpbWUgYmFzZWQgdGVzdHMKICB0ZXN0cy9wZXJm
X3BtdTogQ29udmVydCB0byBmbGFncwogIHRlc3RzL3BlcmZfcG11OiBBZGQgdHJhaWxpbmcgZWRn
ZSBpZGxlIHRlc3QgdmFyaWFudHMKICB0ZXN0cy9wZXJmX3BtdTogUE1VIGVuYWJsZSByYWNlIHRl
c3QKICB0ZXN0cy9wZXJmX3BtdTogQWx3YXlzIHNraXAgbWlzc2luZyBlbmdpbmVzCiAgdGVzdHMv
cGVyZl9wbXU6IEV4cGxpY2l0bHkgdGVzdCBmb3IgZW5naW5lIGF2YWlsYWJpbGl0eSBpbiBpbml0
IHRlc3RzCiAgdGVzdHMvcGVyZl9wbXU6IFVzZSBzaG9ydCBiYXRjaGVzIGZyb20gaG90cGx1ZyB0
ZXN0CgogdGVzdHMvcGVyZl9wbXUuYyB8IDMyMCArKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrLS0tLS0tLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgMjQ5IGluc2VydGlv
bnMoKyksIDcxIGRlbGV0aW9ucygtKQoKLS0gCjIuMTQuMQoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBtYWlsaW5nIGxpc3QKaWd0LWRldkBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1h
bi9saXN0aW5mby9pZ3QtZGV2Cg==
