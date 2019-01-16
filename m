Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-qt1-x843.google.com (mail-qt1-x843.google.com
 [IPv6:2607:f8b0:4864:20::843])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C4C86E0ED
 for <igt-dev@lists.freedesktop.org>; Wed, 16 Jan 2019 12:15:46 +0000 (UTC)
Received: by mail-qt1-x843.google.com with SMTP id t13so6867834qtn.3
 for <igt-dev@lists.freedesktop.org>; Wed, 16 Jan 2019 04:15:46 -0800 (PST)
Date: Wed, 16 Jan 2019 10:15:41 -0200
From: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>
Message-ID: <20190116121541.zjlebxnwasdfl7jx@smtp.gmail.com>
References: <20190116112050.27647-1-petri.latvala@intel.com>
 <20190116112050.27647-22-petri.latvala@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190116112050.27647-22-petri.latvala@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t 21/21] lib/drmtest: Don't read from NULL
 in set_forced_driver
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
To: Petri Latvala <petri.latvala@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

T24gMDEvMTYsIFBldHJpIExhdHZhbGEgd3JvdGU6Cj4gVGhlIG9ubHkgY2FsbGVyIHNvIGZhciBu
ZXZlciBwYXNzZXMgTlVMTCBzbyBubyBlZmZlY3RzIHRvZGF5Lgo+IAo+IFNpZ25lZC1vZmYtYnk6
IFBldHJpIExhdHZhbGEgPHBldHJpLmxhdHZhbGFAaW50ZWwuY29tPgo+IENjOiBSb2RyaWdvIFNp
cXVlaXJhIDxyb2RyaWdvc2lxdWVpcmFtZWxvQGdtYWlsLmNvbT4KPiBDYzogRGFuaWVsIFZldHRl
ciA8ZGFuaWVsLnZldHRlckBmZndsbC5jaD4KPiAtLS0KPiAgbGliL2RybXRlc3QuYyB8IDQgKysr
LQo+ICAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCj4gCj4g
ZGlmZiAtLWdpdCBhL2xpYi9kcm10ZXN0LmMgYi9saWIvZHJtdGVzdC5jCj4gaW5kZXggN2MxMjRh
YzYuLjE5NjQ3OTVhIDEwMDY0NAo+IC0tLSBhL2xpYi9kcm10ZXN0LmMKPiArKysgYi9saWIvZHJt
dGVzdC5jCj4gQEAgLTEzNCw4ICsxMzQsMTAgQEAgc3RhdGljIGNoYXIgX2ZvcmNlZF9kcml2ZXJb
MTZdID0gIiI7Cj4gICAqLwo+ICB2b2lkIF9fc2V0X2ZvcmNlZF9kcml2ZXIoY29uc3QgY2hhciAq
bmFtZSkKPiAgewo+IC0JaWYgKCFuYW1lKQo+ICsJaWYgKCFuYW1lKSB7Cj4gIAkJaWd0X3dhcm4o
Ik5vIGRyaXZlciBzcGVjaWZpZWQsIGtlZXAgZGVmYXVsdCBiZWhhdmlvdXJcbiIpOwo+ICsJCXJl
dHVybjsKPiArCX0KPiAgCj4gIAlzdHJuY3B5KF9mb3JjZWRfZHJpdmVyLCBuYW1lLCBzaXplb2Yo
X2ZvcmNlZF9kcml2ZXIpIC0gMSk7Cj4gIH0KPiAtLSAKPiAyLjE5LjEKPiAKCkhpLAoKSSB0cmll
ZCB0byBhcHBseSB0aGUgcGF0Y2gsIGFuZCBpdCBkb2VzIG5vdCBhcHBsaWVkIGRpcmVjdGx5IChJ
IHVwZGF0ZWQKbXkgbWFzdGVyIGJlZm9yZSB0ZXN0KS4gSSBnb3QgdGhlIGZvbGxvd2luZyBlcnJv
cjoKCiBlcnJvcjogcGF0Y2ggZmFpbGVkOiBsaWIvZHJtdGVzdC5jOjEzNAogZXJyb3I6IGxpYi9k
cm10ZXN0LmM6IHBhdGNoIGRvZXMgbm90IGFwcGx5CgpBbnl3YXksIGZvciBtZSwgZXZlcnl0aGlu
ZyBpcyBmaW5lIHdpdGggdGhlIGNoYW5nZXMuIEFkZGl0aW9uYWxseSwgSQp0ZXN0ZWQgdGhlIHBh
dGNoIHdpdGg6CgogQ29tbWFuZHM6CgogSUdUX0ZPUkNFX0RSSVZFUj12a21zIC4vdGVzdHMva21z
X2ZsaXAgIC0tcnVuLXN1YnRlc3QgYmFzaWMtZmxpcC12cy13Zl92YmxhbmsKIElHVF9GT1JDRV9E
UklWRVI9IC4vdGVzdHMva21zX2ZsaXAgIC0tcnVuLXN1YnRlc3QgYmFzaWMtZmxpcC12cy13Zl92
YmxhbmsKIC4vdGVzdHMva21zX2ZsaXAgIC0tcnVuLXN1YnRlc3QgYmFzaWMtZmxpcC12cy13Zl92
YmxhbmsKCiBFbnZpcm9ubWVudDoKCiAtPiBRZW11IFZNIHdpdGggQXJjaCBsaW51eAogLT4gR1BV
cyBkcml2ZXJzOiBCb3NjaCAoY2FyZDApIGFuZCB2a21zIChjYXJkMSkKIC0+IEtlcm5lbCAtIDUu
MC4wLXJjMQoKUmV2aWV3ZWQtYnk6IFJvZHJpZ28gU2lxdWVpcmEgPHJvZHJpZ29zaXF1ZWlyYW1l
bG9AZ21haWwuY29tPgoKLS0gClJvZHJpZ28gU2lxdWVpcmEKaHR0cHM6Ly9zaXF1ZWlyYS50ZWNo
CkdyYWR1YXRlIFN0dWRlbnQKRGVwYXJ0bWVudCBvZiBDb21wdXRlciBTY2llbmNlClVuaXZlcnNp
dHkgb2YgU8OjbyBQYXVsbwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwppZ3QtZGV2IG1haWxpbmcgbGlzdAppZ3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2lndC1kZXYK
