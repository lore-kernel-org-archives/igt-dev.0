Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7232E6E025
 for <igt-dev@lists.freedesktop.org>; Wed, 24 Jan 2018 11:22:11 +0000 (UTC)
References: <20180124102500.71999-1-maarten.lankhorst@linux.intel.com>
 <151679208421.13096.6619668340989603229@mail.alporthouse.com>
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Message-ID: <891fc5fe-db82-16d3-970e-18eff5d32b2a@linux.intel.com>
Date: Wed, 24 Jan 2018 12:22:07 +0100
MIME-Version: 1.0
In-Reply-To: <151679208421.13096.6619668340989603229@mail.alporthouse.com>
Content-Language: en-US
Subject: Re: [igt-dev] [PATCH i-g-t] tests/kms_render: Rewrite test to take
 advantage of igt_display.
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
To: Chris Wilson <chris@chris-wilson.co.uk>, igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

T3AgMjQtMDEtMTggb20gMTI6MDggc2NocmVlZiBDaHJpcyBXaWxzb246Cj4gUXVvdGluZyBNYWFy
dGVuIExhbmtob3JzdCAoMjAxOC0wMS0yNCAxMDoyNTowMCkKPj4gVGhpcyB0ZXN0IHdhcyB0YWtp
bmcgfjEwMHMgZm9yIGVhY2ggc3VidGVzdCwgYW5kIGJvdGggdGVzdHMgd2VyZSB0aGUgc2FtZSwK
Pj4gYnV0IHJlcXVpcmVkIHRoZSB1c2VyIHRvIHBheSBhdHRlbnRpb24uIEkndmUgY2hhbmdlZCBp
dCB0byBhdXRvbWF0ZWQKPj4gY2hlY2tpbmcgd2l0aCBDUkMsIGFuZCByZW1vdmVkIHRoZSBzdWJ0
ZXN0cy4KPiBXaGF0IGRvIHdlIGRvIGhlcmUgdGhhdCBpc24ndCBjb3ZlcmVkIGJ5IGttc19mcm9u
dGJ1ZmZlcio/IE15IGd1ZXNzCj4gd291bGQgYmUgZG8gc2ltcGxlIHRlc3Rpbmcgb2YgbW9yZSBj
b25maWd1cmF0aW9ucyAoYXMgb3Bwb3NlZCB0bwo+IGttc19mcm9udGJ1ZmZlciB0aGF0IGRvZXMg
bG90cyBvZiBkaWZmZXJlbnQgZHJhd2luZyB0byB0aGUgc2FtZQo+IGNvbmZpZ3VyYXRpb24pLgpI
bSBwcm9iYWJseSByaWdodC4gSSB3b3VsZG4ndCBtaW5kIHJlbW92aW5nIGl0IHRvbywgdG8gYmUg
aG9uZXN0Li4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
aWd0LWRldiBtYWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6
Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2Cg==
