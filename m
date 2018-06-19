Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-wm0-x229.google.com (mail-wm0-x229.google.com
 [IPv6:2a00:1450:400c:c09::229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6140F6E0A4
 for <igt-dev@lists.freedesktop.org>; Tue, 19 Jun 2018 06:46:44 +0000 (UTC)
Received: by mail-wm0-x229.google.com with SMTP id p126-v6so17953884wmb.2
 for <igt-dev@lists.freedesktop.org>; Mon, 18 Jun 2018 23:46:44 -0700 (PDT)
MIME-Version: 1.0
References: <20180606222741.24096-1-lucas.demarchi@intel.com>
In-Reply-To: <20180606222741.24096-1-lucas.demarchi@intel.com>
From: Lucas De Marchi <lucas.de.marchi@gmail.com>
Date: Mon, 18 Jun 2018 23:46:31 -0700
Message-ID: <CAKi4VALGU5K5oNxQijgXi6gLdx3N3-6fphu6k14LGO9fLrv9Xw@mail.gmail.com>
Subject: Re: [igt-dev] [PATCH i-g-t 1/4] tests/sw_sync: fix pthread
 start_routine declaration
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
To: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

UGluZz8KCkx1Y2FzIERlIE1hcmNoaQpPbiBXZWQsIEp1biA2LCAyMDE4IGF0IDM6MzEgUE0gTHVj
YXMgRGUgTWFyY2hpIDxsdWNhcy5kZW1hcmNoaUBpbnRlbC5jb20+IHdyb3RlOgo+Cj4gcHRocmVh
ZF9jcmVhdGUoKSBleHBlY3RzIGEgdm9pZCAqKCpzdGFydF9yb3V0aW5lKSAodm9pZCAqKS4gRml4
IHdhcm5pbmcKPiB0aGUgZm9sbG93aW5nIHdhcm5pbmcgb24gZ2NjIDg6Cj4KPiAuLi90ZXN0cy9z
d19zeW5jLmM6NzczOjM3OiB3YXJuaW5nOiBjYXN0IGJldHdlZW4gaW5jb21wYXRpYmxlIGZ1bmN0
aW9uIHR5cGVzIGZyb20g4oCYaW50ICgqKSh2b2lkICop4oCZIHRvIOKAmHZvaWQgKiAoKikodm9p
ZCAqKeKAmSBbLVdjYXN0LWZ1bmN0aW9uLXR5cGVdCj4gICAgcHRocmVhZF9jcmVhdGUoJnRocmVh
ZHNbaV0sIE5VTEwsICh2b2lkICogKCopKHZvaWQgKikpCj4gICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIF4KPiBTaWduZWQtb2ZmLWJ5OiBMdWNhcyBEZSBNYXJjaGkgPGx1Y2Fz
LmRlbWFyY2hpQGludGVsLmNvbT4KPiAtLS0KPiAgdGVzdHMvc3dfc3luYy5jIHwgNCArKy0tCj4g
IDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCj4KPiBkaWZm
IC0tZ2l0IGEvdGVzdHMvc3dfc3luYy5jIGIvdGVzdHMvc3dfc3luYy5jCj4gaW5kZXggMjBkZmJi
YjkuLmFmZTU4YjBjIDEwMDY0NAo+IC0tLSBhL3Rlc3RzL3N3X3N5bmMuYwo+ICsrKyBiL3Rlc3Rz
L3N3X3N5bmMuYwo+IEBAIC02NjksNyArNjY5LDcgQEAgc3RhdGljIHN0cnVjdCB7Cj4gICAgICAg
ICBwdGhyZWFkX211dGV4X3QgbG9jazsKPiAgfSB0ZXN0X21wc2NfZGF0YTsKPgo+IC1zdGF0aWMg
aW50IG1wc2NfcHJvZHVjZXJfdGhyZWFkKHZvaWQgKmQpCj4gK3N0YXRpYyB2b2lkICptcHNjX3By
b2R1Y2VyX3RocmVhZCh2b2lkICpkKQo+ICB7Cj4gICAgICAgICBpbnQgaWQgPSAobG9uZylkOwo+
ICAgICAgICAgaW50IGZlbmNlLCBpOwo+IEBAIC03MDIsNyArNzAyLDcgQEAgc3RhdGljIGludCBt
cHNjX3Byb2R1Y2VyX3RocmVhZCh2b2lkICpkKQo+ICAgICAgICAgICAgICAgICBjbG9zZShmZW5j
ZSk7Cj4gICAgICAgICB9Cj4KPiAtICAgICAgIHJldHVybiAwOwo+ICsgICAgICAgcmV0dXJuIE5V
TEw7Cj4gIH0KPgo+ICBzdGF0aWMgaW50IG1wc2NfY29uc3VtZXJfdGhyZWFkKHZvaWQpCj4gLS0K
PiAyLjE3LjEKPgo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCj4gaWd0LWRldiBtYWlsaW5nIGxpc3QKPiBpZ3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9y
Zwo+IGh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaWd0LWRl
dgoKCgotLSAKTHVjYXMgRGUgTWFyY2hpCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmlndC1kZXYgbWFpbGluZyBsaXN0CmlndC1kZXZAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8v
aWd0LWRldgo=
