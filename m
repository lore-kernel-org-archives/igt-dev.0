Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
From: Brian Starkey <Brian.Starkey@arm.com>
Date: Mon, 4 Feb 2019 13:31:35 +0000
Message-ID: <20190204133134.a6cpke3h6x53eeo3@DESKTOP-E1NTVVP.localdomain>
References: <20190115174747.3138-1-liviu.dudau@arm.com>
 <20190115174747.3138-2-liviu.dudau@arm.com>
In-Reply-To: <20190115174747.3138-2-liviu.dudau@arm.com>
Content-Language: en-US
Content-ID: <090500948974504894C3DF03C533D6F5@eurprd08.prod.outlook.com>
MIME-Version: 1.0
Subject: Re: [Intel-gfx] [PATCH i-g-t v5 1/6] lib/igt_kms: Add writeback
 support
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/intel-gfx>
List-Post: <mailto:intel-gfx@lists.freedesktop.org>
List-Help: <mailto:intel-gfx-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>
To: Liviu Dudau <Liviu.Dudau@arm.com>
Cc: Boris Brezillon <boris.brezillon@free-electrons.com>, Intel GFX ML <intel-gfx@lists.freedesktop.org>, IGT GPU Tools <igt-dev@lists.freedesktop.org>, nd <nd@arm.com>
List-ID: <igt-dev@lists.freedesktop.org>

SGkgTGl2aXUsCgpPbiBUdWUsIEphbiAxNSwgMjAxOSBhdCAwNTo0Nzo0MlBNICswMDAwLCBMaXZp
dSBEdWRhdSB3cm90ZToKPiBGcm9tOiBCcmlhbiBTdGFya2V5IDxicmlhbi5zdGFya2V5QGFybS5j
b20+Cgpbc25pcF0KCj4gIAo+ICsvKioKPiArICogaWd0X291dHB1dF9zZXRfd3JpdGViYWNrX2Zi
Ogo+ICsgKiBAb3V0cHV0OiBUYXJnZXQgb3V0cHV0Cj4gKyAqIEBmYjogVGFyZ2V0IGZyYW1lYnVm
ZmVyCj4gKyAqCj4gKyAqIFRoaXMgZnVuY3Rpb24gc2V0cyB0aGUgZ2l2ZW4gQGZiIHRvIGJlIHVz
ZWQgYXMgdGhlIHRhcmdldCBmcmFtZWJ1ZmZlciBmb3IgdGhlCj4gKyAqIHdyaXRlYmFjayBlbmdp
bmUgYXQgdGhlIG5leHQgYXRvbWljIGNvbW1pdC4gSXQgd2lsbCBhbHNvIHJlcXVlc3QgYSB3cml0
ZWJhY2sKPiArICogb3V0IGZlbmNlIHRoYXQgd2lsbCBjb250YWluIHRoZSBmZCBudW1iZXIgb2Yg
dGhlIG91dCBmZW5jZSBjcmVhdGVkIGJ5IEtNUyBpZgo+ICsgKiB0aGUgZ2l2ZW4gQGZiIGlzIHZh
bGlkLgo+ICsgKi8KPiArdm9pZCBpZ3Rfb3V0cHV0X3NldF93cml0ZWJhY2tfZmIoaWd0X291dHB1
dF90ICpvdXRwdXQsIHN0cnVjdCBpZ3RfZmIgKmZiKQo+ICt7Cj4gKwlpZ3RfZGlzcGxheV90ICpk
aXNwbGF5ID0gb3V0cHV0LT5kaXNwbGF5Owo+ICsKPiArCUxPRyhkaXNwbGF5LCAiJXM6IG91dHB1
dF9zZXRfd3JpdGViYWNrX2ZiKCVkKVxuIiwgb3V0cHV0LT5uYW1lLCBmYiA/IGZiLT5mYl9pZCA6
IDApOwo+ICsKPiArCWlndF9vdXRwdXRfc2V0X3Byb3BfdmFsdWUob3V0cHV0LCBJR1RfQ09OTkVD
VE9SX1dSSVRFQkFDS19GQl9JRCwgZmIgPyBmYi0+ZmJfaWQgOiAwKTsKPiArCS8qIG9ubHkgcmVx
dWVzdCBhIHdyaXRlYmFjayBvdXQgZmVuY2UgaWYgdGhlIGZyYW1lYnVmZmVyIGlzIHZhbGlkICov
Cj4gKwlpZiAoZmIpCj4gKwkJaWd0X291dHB1dF9zZXRfcHJvcF92YWx1ZShvdXRwdXQsIElHVF9D
T05ORUNUT1JfV1JJVEVCQUNLX09VVF9GRU5DRV9QVFIsCj4gKwkJCQkJICAocHRyZGlmZl90KSZv
dXRwdXQtPndyaXRlYmFja19vdXRfZmVuY2VfZmQpOwoKSSdtIHN0aWxsIG5vdCBzdXJlIChwdHJk
aWZmX3QpIGlzIHRoZSByaWdodCB0eXBlIGhlcmUsICh1aW50cHRyX3QpCnNlZW1zIGJldHRlci4K
ClRoYW5rcywKLUJyaWFuCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCkludGVsLWdmeCBtYWlsaW5nIGxpc3QKSW50ZWwtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2ludGVs
LWdmeAo=
