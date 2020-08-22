Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from netline-mail3.netline.ch (mail.netline.ch [148.251.143.178])
 by gabe.freedesktop.org (Postfix) with ESMTP id 408956E445
 for <igt-dev@lists.freedesktop.org>; Sat, 22 Aug 2020 09:08:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by netline-mail3.netline.ch (Postfix) with ESMTP id D5CEA2A6042
 for <igt-dev@lists.freedesktop.org>; Sat, 22 Aug 2020 11:08:16 +0200 (CEST)
Received: from netline-mail3.netline.ch ([127.0.0.1])
 by localhost (netline-mail3.netline.ch [127.0.0.1]) (amavisd-new, port 10024)
 with LMTP id pxDXY0f60wV1 for <igt-dev@lists.freedesktop.org>;
 Sat, 22 Aug 2020 11:08:16 +0200 (CEST)
Received: from thor (212.174.63.188.dynamic.wline.res.cust.swisscom.ch
 [188.63.174.212])
 by netline-mail3.netline.ch (Postfix) with ESMTPSA id 74D132A6016
 for <igt-dev@lists.freedesktop.org>; Sat, 22 Aug 2020 11:08:16 +0200 (CEST)
Received: from [::1] by thor with esmtp (Exim 4.94)
 (envelope-from <michel@daenzer.net>) id 1k9PVX-0009zD-Hc
 for igt-dev@lists.freedesktop.org; Sat, 22 Aug 2020 11:08:15 +0200
References: <20200821163928.1072379-1-michel@daenzer.net>
 <159803492175.16198.892699385799556109@emeril.freedesktop.org>
From: =?UTF-8?Q?Michel_D=c3=a4nzer?= <michel@daenzer.net>
Message-ID: <1f2bafb1-e3c2-8295-c8c1-816410759f41@daenzer.net>
Date: Sat, 22 Aug 2020 11:08:15 +0200
MIME-Version: 1.0
In-Reply-To: <159803492175.16198.892699385799556109@emeril.freedesktop.org>
Content-Language: en-CA
Subject: Re: [igt-dev]
 =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgdGVzdHMv?=
 =?utf-8?q?kms=3A_Turn_off_pipe_as_well_if_all_planes_are_off?=
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

T24gMjAyMC0wOC0yMSA4OjM1IHAubS4sIFBhdGNod29yayB3cm90ZToKPiAKPiBQb3NzaWJsZSBu
ZXcgaXNzdWVzCj4gLS0tLS0tLS0tLS0tLS0tLS0tLQo+IAo+ICAgSGVyZSBhcmUgdGhlIHVua25v
d24gY2hhbmdlcyB0aGF0IG1heSBoYXZlIGJlZW4gaW50cm9kdWNlZCBpbiBJR1RQV180OTAyX2Z1
bGw6Cj4gCj4gIyMjIElHVCBjaGFuZ2VzICMjIwo+IAo+ICMjIyMgUG9zc2libGUgcmVncmVzc2lv
bnMgIyMjIwo+IAo+ICAgKiBpZ3RAa21zX2JpZ19mYkBsaW5lYXItMzJicHAtcm90YXRlLTA6Cj4g
ICAgIC0gc2hhcmQtdGdsYjogICAgICAgICBbUEFTU11bMV0gLT4gW0ZBSUxdWzJdCj4gICAgWzFd
OiBodHRwczovL2ludGVsLWdmeC1jaS4wMS5vcmcvdHJlZS9kcm0tdGlwL0NJX0RSTV84OTEzL3No
YXJkLXRnbGI1L2lndEBrbXNfYmlnX2ZiQGxpbmVhci0zMmJwcC1yb3RhdGUtMC5odG1sCj4gICAg
WzJdOiBodHRwczovL2ludGVsLWdmeC1jaS4wMS5vcmcvdHJlZS9kcm0tdGlwL0lHVFBXXzQ5MDIv
c2hhcmQtdGdsYjUvaWd0QGttc19iaWdfZmJAbGluZWFyLTMyYnBwLXJvdGF0ZS0wLmh0bWwKClRo
aXMgaXMgYSBmYWxzZSBwb3NpdGl2ZSwgc2luY2UgbXkgc2VyaWVzIGRvZXNuJ3QgYWZmZWN0IHRo
aXMgdGVzdC4KCgotLSAKRWFydGhsaW5nIE1pY2hlbCBEw6RuemVyICAgICAgICAgICAgICAgfCAg
ICAgICAgICAgICAgIGh0dHBzOi8vcmVkaGF0LmNvbQpMaWJyZSBzb2Z0d2FyZSBlbnRodXNpYXN0
ICAgICAgICAgICAgIHwgICAgICAgICAgICAgTWVzYSBhbmQgWCBkZXZlbG9wZXIKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBtYWlsaW5nIGxp
c3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2Cg==
