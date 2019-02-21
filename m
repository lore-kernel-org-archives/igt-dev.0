Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 55C3489450
 for <igt-dev@lists.freedesktop.org>; Thu, 21 Feb 2019 23:20:56 +0000 (UTC)
Message-ID: <640998b08ffa6ee4ac0ddfa3b6b40a3a47923305.camel@intel.com>
From: Dhinakaran Pandiyan <dhinakaran.pandiyan@intel.com>
Date: Thu, 21 Feb 2019 15:20:35 -0800
In-Reply-To: <20190221140613.GL20097@intel.com>
References: <20190221024123.17516-1-dhinakaran.pandiyan@intel.com>
 <20190221024123.17516-3-dhinakaran.pandiyan@intel.com>
 <20190221140613.GL20097@intel.com>
Mime-Version: 1.0
Subject: Re: [igt-dev] [HAX 3/5] lib/igt_fb: Use rendercopy for rendering
 into compressed buffers
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: dhinakaran.pandiyan@intel.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Ville =?ISO-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

T24gVGh1LCAyMDE5LTAyLTIxIGF0IDE2OjA2ICswMjAwLCBWaWxsZSBTeXJqw6Rsw6Qgd3JvdGU6
Cj4gT24gV2VkLCBGZWIgMjAsIDIwMTkgYXQgMDY6NDE6MjFQTSAtMDgwMCwgRGhpbmFrYXJhbiBQ
YW5kaXlhbiB3cm90ZToKPiA+IEBAIC0yMzk3LDggKzI1MjMsMTAgQEAgY2Fpcm9fc3VyZmFjZV90
ICppZ3RfZ2V0X2NhaXJvX3N1cmZhY2UoaW50Cj4gPiBmZCwgc3RydWN0IGlndF9mYiAqZmIpCj4g
PiAgCQkgICAgKChmLT5jYWlyb19pZCA9PSBDQUlST19GT1JNQVRfSU5WQUxJRCkgJiYKPiA+ICAJ
CSAgICAgKGYtPnBpeG1hbl9pZCAhPSBQSVhNQU5faW52YWxpZCkpKQo+ID4gIAkJCWNyZWF0ZV9j
YWlyb19zdXJmYWNlX19jb252ZXJ0KGZkLCBmYik7CkFsbCBCR1IgZm9ybWF0cyB3aWxsIHRha2Ug
dGhpcyBwYXRoIGFuZCBpdCBzb21laG93IHJlc3VsdHMgaW4gWWYtQ0NTCnRlc3RzIHNwZWNpZmlj
YWxseSBmYWlsaW5nLgoKCj4gPiArCQllbHNlIGlmIChpc19jY3NfbW9kaWZpZXIoZmItPnRpbGlu
ZykpCj4gPiArCQkJY3JlYXRlX2NhaXJvX3N1cmZhY2VfX3JlbmRlcmNvcHkoZmQsIGZiKTsKPiA+
ICAJCWVsc2UgaWYgKGZiLT50aWxpbmcgPT0gTE9DQUxfSTkxNV9GT1JNQVRfTU9EX1lfVElMRUQg
fHwKPiA+IC0JCSAgICBmYi0+dGlsaW5nID09IExPQ0FMX0k5MTVfRk9STUFUX01PRF9ZZl9USUxF
RCkKPiA+ICsJCQkgZmItPnRpbGluZyA9PSBMT0NBTF9JOTE1X0ZPUk1BVF9NT0RfWWZfVElMRUQp
Cj4gPiAgCQkJY3JlYXRlX2NhaXJvX3N1cmZhY2VfX2JsaXQoZmQsIGZiKTsKPiA+ICAJCWVsc2UK
PiA+ICAJCQljcmVhdGVfY2Fpcm9fc3VyZmFjZV9fZ3R0KGZkLCBmYik7Cj4gCj4gT2gsIGFuZCB0
aGlzIHJlbWluZHMgbWUgdGhhdCB3ZSBzdGlsbCBoYXZlIHRoZSA8MzJrIGJ5dGUgYmxpdHRlcgo+
IHN0cmlkZQo+IHByb2JsZW0sIHdoaWNoIEkgdHJpZWQgdG8gYWRkcmVzcyBhIGJpdCBpbgo+IGh0
dHBzOi8vcGF0Y2h3b3JrLmZyZWVkZXNrdG9wLm9yZy9wYXRjaC8yNDg1NDMvCj4gYnkgdXNpbmcg
Z3R0IG1tYXBzIGluc3RlYWQuIEhvd2V2ZXIgdGhhdCBmYWlsZWQgZm9yIFlmIHNpbmNlIGZlbmNl
cwo+IGNhbid0Cj4gaGFuZGxlIFlmLgpXb25kZXIgaWYgdGhpcyBoYXMgZ290IHNvbWV0aGluZyB0
byBkbyB3aXRoIEJHUiBmb3JtYXQgZmFpbHVyZXMuCgo+ICBNeSBpbml0aWFsIGlkZWEgd2FzIHRv
IGNwdSBtbWFwIGFuZCB0aWxlL2RldGlsZSBtYW51YWxseSwKPiBidXQgd2UgY291bGQgYWN0dWFs
bHkgY29uc2lkZXIgdXNpbmcgcmVuZGVyY29weSBpbnN0ZWFkLgo+IAoKTW9yZSB3b3JrIGZvciBZ
ZiB0aGVuLgotREsKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmlndC1kZXYgbWFpbGluZyBsaXN0CmlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0
dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaWd0LWRldg==
