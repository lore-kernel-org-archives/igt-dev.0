Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB3706E2E2
 for <igt-dev@lists.freedesktop.org>; Tue, 31 Mar 2020 11:42:14 +0000 (UTC)
MIME-Version: 1.0
In-Reply-To: <20200331111911.122768-1-michal@hardline.pl>
References: <20200331111911.122768-1-michal@hardline.pl>
From: Chris Wilson <chris@chris-wilson.co.uk>
Message-ID: <158565491513.18289.11896229632743132807@build.alporthouse.com>
Date: Tue, 31 Mar 2020 12:41:55 +0100
Subject: Re: [igt-dev] [PATCH] lib/igt_dummyload: Use timerfd rather than
 SIGEV_THREAD
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
To: michal@hardline.pl, igt-dev@lists.freedesktop.org
Cc: michal.winiarski@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

UXVvdGluZyBNaWNoYcWCIFdpbmlhcnNraSAoMjAyMC0wMy0zMSAxMjoxOToxMSkKPiAtc3RhdGlj
IHZvaWQgbm90aWZ5KHVuaW9uIHNpZ3ZhbCBhcmcpCj4gK3N0YXRpYyB2b2lkICp0aW1lcl90aHJl
YWQodm9pZCAqZGF0YSkKPiAgewo+IC0gICAgICAgaWd0X3NwaW5fdCAqc3BpbiA9IGFyZy5zaXZh
bF9wdHI7Cj4gKyAgICAgICBpZ3Rfc3Bpbl90ICpzcGluID0gZGF0YTsKPiArICAgICAgIHN0cnVj
dCBwb2xsZmQgcGZkOwo+ICsgICAgICAgaW50IHJldDsKPiAgCj4gLSAgICAgICBpZ3Rfc3Bpbl9l
bmQoc3Bpbik7Cj4gKyAgICAgICBwZmQuZmQgPSBzcGluLT50aW1lcmZkOwo+ICsgICAgICAgcGZk
LmV2ZW50cyA9IFBPTExJTjsKPiArCj4gKyAgICAgICByZXQgPSBwb2xsKCZwZmQsIDEsIC0xKTsK
PiArICAgICAgIGlmIChyZXQgPj0gMCkKPiArICAgICAgICAgICAgICAgaWd0X3NwaW5fZW5kKHNw
aW4pOwoKdWludDY0X3QgY291bnQ7CgppZiAocmVhZChzcGluLT50aW1lcl9mZCwgJmNvdW50LCBz
aXplb2YoY291bnQpKSA+IDApCglpZ3Rfc3Bpbl9lbmQoc3Bpbik7Cgp3b3VsZCBzdWZmaWNlLiBO
b3Qgc3VyZSBvZiB0aGUgY29tcGFyYXRpdmUgbGF0ZW5jeS4KCkhvd2V2ZXIsIHRoYXQgd291bGQg
YWxsb3cgdXMgdG8gY2xvc2Uoc3Bpbi0+dGltZXJmZCkgZmlyc3QgaW4KY2FuY2VsbGF0aW9uLCB3
b3VsZCBzaG91bGQgcmVwb3J0IC1FQ0FOQ0VMTEVEIHF1aWNrZXN0LgoKU28gb3ZlcmFsbCwgSSdt
IGxlZnQgd2l0aCB0aGUgd29ycnkgb2YgYSB0aHJlYWQgcGVyIHRpbWVvdXQuIFRob3VnaCB3ZQpk
byB0eXBpY2FsbHkgb25seSB1c2Ugb25lIHNwaW5uZXIgdGltZW91dCBhdCBhIHRpbWUsIHNvIGl0
J3MgbWVyZWx5IHRoZQpvdmVyaGVhZCBvZiBjcmVhdGluZyBhIHRocmVhZCB3aGljaCBzaG91bGQg
bm90IGJlIHNpZ25pZmljYW50LgoKT2ssIHNvIGp1c3QgdGhlIHF1ZXN0aW9uIG9mIHBvbGwoKSB2
cyByZWFkKCkgW2FuZCBjb3JyZXNwb25kaW5nIGNsZWFudXAKb3JkZXJdIGFuZCB3ZSdyZSBnb29k
LgotQ2hyaXMKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
aWd0LWRldiBtYWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6
Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2Cg==
