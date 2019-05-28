Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 785EE89C1B
 for <igt-dev@lists.freedesktop.org>; Tue, 28 May 2019 13:52:20 +0000 (UTC)
From: "C, Ramalingam" <ramalingam.c@intel.com>
Date: Tue, 28 May 2019 13:52:15 +0000
Message-ID: <3E576CE581B70742841A8994F80CE2EE4E15CC99@BGSMSX104.gar.corp.intel.com>
References: <20190528134702.3706-1-simon.ser@intel.com>
In-Reply-To: <20190528134702.3706-1-simon.ser@intel.com>
Content-Language: en-US
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t] lib/igt: fix igt_audio include
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
To: "Ser, Simon" <simon.ser@intel.com>, "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Cc: "Peres, Martin" <martin.peres@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQo+IEZyb206IFNlciwgU2ltb24KPiBTZW50OiBU
dWVzZGF5LCBNYXkgMjgsIDIwMTkgNzoxNyBQTQo+IFRvOiBpZ3QtZGV2QGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwo+IENjOiBIaWxlciwgQXJrYWRpdXN6IDxhcmthZGl1c3ouaGlsZXJAaW50ZWwuY29t
PjsgUGVyZXMsIE1hcnRpbgo+IDxtYXJ0aW4ucGVyZXNAaW50ZWwuY29tPjsgQywgUmFtYWxpbmdh
bSA8cmFtYWxpbmdhbS5jQGludGVsLmNvbT4KPiBTdWJqZWN0OiBbUEFUQ0ggaS1nLXRdIGxpYi9p
Z3Q6IGZpeCBpZ3RfYXVkaW8gaW5jbHVkZQo+IAo+IGlndF9hdWRpbyBpbmNsdWRlcyBhIGxpYmFz
b3VuZCBoZWFkZXIuIFdlIHNob3VsZCBndWFyZCBpdCBiZWhpbmQKPiBIQVZFX0NIQU1FTElVTS4K
PiAKPiBTaWduZWQtb2ZmLWJ5OiBTaW1vbiBTZXIgPHNpbW9uLnNlckBpbnRlbC5jb20+ClJldmll
d2VkLWJ5OiBSYW1hbGluZ2FtIEMgPHJhbWFsaW5nYW0uY0BpbnRlbC5jb20+CgotUmFtLgo+IC0t
LQo+ICBsaWIvaWd0LmggfCAyICstCj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwg
MSBkZWxldGlvbigtKQo+IAo+IGRpZmYgLS1naXQgYS9saWIvaWd0LmggYi9saWIvaWd0LmgKPiBp
bmRleCA4MmNkZDU3YTRkZWIuLmE2YzRlNDRkMjE3MiAxMDA2NDQKPiAtLS0gYS9saWIvaWd0LmgK
PiArKysgYi9saWIvaWd0LmgKPiBAQCAtMzUsMTMgKzM1LDEzIEBACj4gICNpbmNsdWRlICJpZ3Rf
ZHVtbXlsb2FkLmgiCj4gICNpbmNsdWRlICJpZ3RfZmIuaCIKPiAgI2luY2x1ZGUgImlndF9mcmFt
ZS5oIgo+IC0jaW5jbHVkZSAiaWd0X2F1ZGlvLmgiCj4gICNpbmNsdWRlICJpZ3RfZ3QuaCIKPiAg
I2luY2x1ZGUgImlndF9rbXMuaCIKPiAgI2luY2x1ZGUgImlndF9wbS5oIgo+ICAjaW5jbHVkZSAi
aWd0X3N0YXRzLmgiCj4gICNpZmRlZiBIQVZFX0NIQU1FTElVTQo+ICAjaW5jbHVkZSAiaWd0X2Fs
c2EuaCIKPiArI2luY2x1ZGUgImlndF9hdWRpby5oIgo+ICAjaW5jbHVkZSAiaWd0X2NoYW1lbGl1
bS5oIgo+ICAjaW5jbHVkZSAiaWd0X2NoYW1lbGl1bV9zdHJlYW0uaCIKPiAgI2VuZGlmCj4gLS0K
PiAyLjIxLjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmlndC1kZXYgbWFpbGluZyBsaXN0CmlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaWd0LWRldg==
