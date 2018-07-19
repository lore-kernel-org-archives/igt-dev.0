Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-wm0-x22f.google.com (mail-wm0-x22f.google.com
 [IPv6:2a00:1450:400c:c09::22f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7DBC86ED6B
 for <igt-dev@lists.freedesktop.org>; Thu, 19 Jul 2018 09:36:11 +0000 (UTC)
Received: by mail-wm0-x22f.google.com with SMTP id z6-v6so1274069wma.0
 for <igt-dev@lists.freedesktop.org>; Thu, 19 Jul 2018 02:36:11 -0700 (PDT)
From: Tvrtko Ursulin <tursulin@ursulin.net>
Date: Thu, 19 Jul 2018 10:36:00 +0100
Message-Id: <20180719093601.11788-4-tvrtko.ursulin@linux.intel.com>
In-Reply-To: <20180719093601.11788-1-tvrtko.ursulin@linux.intel.com>
References: <20180719093601.11788-1-tvrtko.ursulin@linux.intel.com>
Subject: [igt-dev] [PATCH i-g-t 3/4] trace.pl: Bring back timeline stacking
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
Cc: intel-gfx@lists.freedesktop.org, Tvrtko Ursulin <tvrtko.ursulin@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

RnJvbTogVHZydGtvIFVyc3VsaW4gPHR2cnRrby51cnN1bGluQGludGVsLmNvbT4KCkJyaW5nIGJh
Y2sgdGhlIGJ1dHRvbiB3aGljaCBleHBhbmRzL3N0YWNrcyBvdmVybGFwcGluZyB0aW1lbGluZSBi
b3hlcy4KCldlIGRlZmF1bHQgdG8gbm8gc3RhY2tpbmcsIGJ1dCBzb21ldGltZXMgZXhwYW5kaW5n
IHRoZSB2aWV3IGNhbiBiZSB1c2VmdWwsCmVzcGVjaWFsbHkgd2l0aCBkZWVwIHJlcXVlc3QgcGlw
ZWxpbmVzLgoKU2lnbmVkLW9mZi1ieTogVHZydGtvIFVyc3VsaW4gPHR2cnRrby51cnN1bGluQGlu
dGVsLmNvbT4KLS0tCiBzY3JpcHRzL3RyYWNlLnBsIHwgNyArKysrKysrCiAxIGZpbGUgY2hhbmdl
ZCwgNyBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvc2NyaXB0cy90cmFjZS5wbCBiL3Njcmlw
dHMvdHJhY2UucGwKaW5kZXggNTlmNmQzMmRjM2M4Li4xOTI0MzMzZTEyYjYgMTAwNzU1Ci0tLSBh
L3NjcmlwdHMvdHJhY2UucGwKKysrIGIvc2NyaXB0cy90cmFjZS5wbApAQCAtOTM1LDYgKzkzNSw3
IEBAIEJveGVzIGFyZSBpbiBmb3JtYXQgJ2N0eC1pZC9zZXFubycuCiA8cD4KIFVzZSBDdHJsK3Nj
cm9sbC1hY3Rpb24gdG8gem9vbS1pbi9vdXQgYW5kIHNjcm9sbC1hY3Rpb24gb3IgZHJhZ2dpbmcg
dG8gbW92ZSBhcm91bmQgdGhlIHRpbWVsaW5lLgogPC9wPgorPGJ1dHRvbiBvbmNsaWNrPSJ0b2dn
bGVTdGFja2luZygpIj5Ub2dnbGUgb3ZlcmxhcCBzdGFja2luZzwvYnV0dG9uPgogPC90ZD4KIDwv
dHI+CiA8L3RhYmxlPgpAQCAtMTI4NCw2ICsxMjg1LDEyIEBAIHByaW50IDw8RU5ESFRNTDsKIAog
ICAvLyBDcmVhdGUgYSBUaW1lbGluZQogICB2YXIgdGltZWxpbmUgPSBuZXcgdmlzLlRpbWVsaW5l
KGNvbnRhaW5lciwgaXRlbXMsIGdyb3Vwcywgb3B0aW9ucyk7CisKKyAgZnVuY3Rpb24gdG9nZ2xl
U3RhY2tpbmcoKSB7CisJb3B0aW9ucy5zdGFjayA9ICFvcHRpb25zLnN0YWNrOworCW9wdGlvbnMu
c3RhY2tTdWJncm91cHMgPSAhb3B0aW9ucy5zdGFja1N1Ymdyb3VwczsKKwl0aW1lbGluZS5zZXRP
cHRpb25zKG9wdGlvbnMpOworICB9CiBFTkRIVE1MCiAKIHByaW50IDw8RU5ESFRNTDsKLS0gCjIu
MTcuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0
LWRldiBtYWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2Cg==
