Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-io0-x244.google.com (mail-io0-x244.google.com
 [IPv6:2607:f8b0:4001:c06::244])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3AA336ECE8
 for <igt-dev@lists.freedesktop.org>; Wed, 31 Jan 2018 20:05:00 +0000 (UTC)
Received: by mail-io0-x244.google.com with SMTP id f4so16548235ioh.8
 for <igt-dev@lists.freedesktop.org>; Wed, 31 Jan 2018 12:05:00 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <20180129120347.29287-1-lionel.g.landwerlin@intel.com>
References: <20180129120347.29287-1-lionel.g.landwerlin@intel.com>
From: Matthew Auld <matthew.william.auld@gmail.com>
Date: Wed, 31 Jan 2018 20:04:29 +0000
Message-ID: <CAM0jSHOE2he6xWJKQtpnDFSVwKC6g7YhdxhhRRs7JW-pkR8m8w@mail.gmail.com>
Subject: Re: [igt-dev] [PATCH i-g-t] tests/perf: fix report validity check
 on gen10+
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
To: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

T24gMjkgSmFudWFyeSAyMDE4IGF0IDEyOjAzLCBMaW9uZWwgTGFuZHdlcmxpbgo8bGlvbmVsLmcu
bGFuZHdlcmxpbkBpbnRlbC5jb20+IHdyb3RlOgo+IFNpZ25lZC1vZmYtYnk6IExpb25lbCBMYW5k
d2VybGluIDxsaW9uZWwuZy5sYW5kd2VybGluQGludGVsLmNvbT4KPiBUZXN0Y2FzZTogaWd0L3Bl
cmYvYnVmZmVyLWZpbGwgJiBpZ3QvcGVyZi9lbmFibGUtZGlzYWJsZSAmIGlndC9wZXJmL2dlbjgt
dW5wcml2aWxlZ2VkLXNpbmdsZS1jdHgtY291bnRlcnMKPiBCdWd6aWxsYTogaHR0cHM6Ly9idWdz
LmZyZWVkZXNrdG9wLm9yZy9zaG93X2J1Zy5jZ2k/aWQ9MTA0NjU4Cj4gLS0tCj4gIHRlc3RzL3Bl
cmYuYyB8IDIgKy0KPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9u
KC0pCj4KPiBkaWZmIC0tZ2l0IGEvdGVzdHMvcGVyZi5jIGIvdGVzdHMvcGVyZi5jCj4gaW5kZXgg
YTE3MzY4MGMuLjU1ZDZlOWVhIDEwMDY0NAo+IC0tLSBhL3Rlc3RzL3BlcmYuYwo+ICsrKyBiL3Rl
c3RzL3BlcmYuYwo+IEBAIC00NzMsNyArNDczLDcgQEAgb2FfcmVwb3J0X2N0eF9pc192YWxpZCh1
aW50MzJfdCAqcmVwb3J0KQo+ICAgICAgICAgICAgICAgICByZXR1cm4gZmFsc2U7IC8qIFRPRE8g
Ki8KPiAgICAgICAgIH0gZWxzZSBpZiAoSVNfR0VOOChkZXZpZCkpIHsKPiAgICAgICAgICAgICAg
ICAgcmV0dXJuIHJlcG9ydFswXSAmICgxdWwgPDwgMjUpOwo+IC0gICAgICAgfSBlbHNlIGlmIChJ
U19HRU45KGRldmlkKSkgewo+ICsgICAgICAgfSBlbHNlIGlmIChBVF9MRUFTVF9HRU4oZGV2aWQs
IDkpKSB7Cj4gICAgICAgICAgICAgICAgIHJldHVybiByZXBvcnRbMF0gJiAoMXVsIDw8IDE2KTsK
PiAgICAgICAgIH0KCkRvIHdlIHdhbnQgdG8gZHJvcCB0aGUgISJyZWFjaGVkIiwgc2luY2UgdGhp
cyBpcyBub3cgdmVyeSBtdWNoIGEgY2F0Y2ggYWxsPwoKQW55d2F5OgpSZXZpZXdlZC1ieTogTWF0
dGhldyBBdWxkIDxtYXR0aGV3LmF1bGRAaW50ZWwuY29tPgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwppZ3QtZGV2IG1haWxpbmcgbGlzdAppZ3QtZGV2QGxp
c3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2lndC1kZXYK
