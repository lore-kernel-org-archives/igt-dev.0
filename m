Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8461089BF5
 for <igt-dev@lists.freedesktop.org>; Tue, 26 Feb 2019 09:46:08 +0000 (UTC)
Date: Tue, 26 Feb 2019 11:46:05 +0200
From: Petri Latvala <petri.latvala@intel.com>
Message-ID: <20190226094605.GB4038@platvala-desk.ger.corp.intel.com>
References: <1551100999-27427-1-git-send-email-sergii.romantsov@globallogic.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1551100999-27427-1-git-send-email-sergii.romantsov@globallogic.com>
Subject: Re: [igt-dev] [PATCH i-g-t v1] meson: missed dependency of liblzma
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
To: Sergii Romantsov <sergii.romantsov@gmail.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

T24gTW9uLCBGZWIgMjUsIDIwMTkgYXQgMDM6MjM6MTlQTSArMDIwMCwgU2VyZ2lpIFJvbWFudHNv
diB3cm90ZToKPiBGYWlsZWQgdG8gY29uZmlndXJlIGludGVsLWdwdS10b29scyB3aXRoIGVycm9y
Ogo+IAo+IAltZXNvbi5idWlsZDoxNTE6MDogRVJST1I6ICBDb3VsZCBub3QgZ2VuZXJhdGUgY2Fy
Z3MgZm9yIGxpYmR3Ogo+IAo+IGxpYmR3IGRlcGVuZHMgb24gbGlibHptYS4KPiBJbnN0YWxsYXRp
b24gb2YgbGlibHptYS1kZXYgZml4ZXMgaXNzdWUuCj4gCj4gRml4ZXM6IGUzOWUwOTkxMGZjOCAo
bGliL2NvcmU6IFVzZSBsaWJkdyB0byBkZWNvZGUgc3RhY2sgdHJhY2Ugd2l0aCBkZWJ1Z2dpbmcg
c3ltYm9scywgdjIuKQo+IENDOiBNYWFydGVuIExhbmtob3JzdCA8bWFhcnRlbi5sYW5raG9yc3RA
bGludXguaW50ZWwuY29tPgo+IFNpZ25lZC1vZmYtYnk6IFNlcmdpaSBSb21hbnRzb3YgPHNlcmdp
aS5yb21hbnRzb3ZAZ2xvYmFsbG9naWMuY29tPgo+IC0tLQo+ICBtZXNvbi5idWlsZCB8IDEgKwo+
ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKykKPiAKPiBkaWZmIC0tZ2l0IGEvbWVzb24u
YnVpbGQgYi9tZXNvbi5idWlsZAo+IGluZGV4IDA5OWRiODkuLjRjNThjYTggMTAwNjQ0Cj4gLS0t
IGEvbWVzb24uYnVpbGQKPiArKysgYi9tZXNvbi5idWlsZAo+IEBAIC0xNDgsNiArMTQ4LDcgQEAg
aWYgd2l0aF9saWJ1bndpbmQgIT0gJ2ZhbHNlJwo+ICBlbmRpZgo+ICBidWlsZF9pbmZvICs9ICdX
aXRoIGxpYnVud2luZDogJyArIGxpYnVud2luZGluZm8KPiAgCj4gK2xpYmx6bWEgPSBkZXBlbmRl
bmN5KCdsaWJsem1hJywgcmVxdWlyZWQgOiB0cnVlKQoKX1dlXyBkb24ndCB1c2UgbGlibHptYSBm
b3IgYW55dGhpbmcgdGhvdWdoLCBzbyB0aGlzIGlzIGtpbmQgb2YKc3VwZXJmbHVvdXMuIEFzIEkg
dW5kZXJzdG9vZCB5b3UsIGp1c3QgaW5zdGFsbGluZyBsaWJsem1hLWRldiBtYWtlcwp0aGUgYnVp
bGQgc3VjY2Vzc2Z1bCwgcmlnaHQ/IE1ha2luZyB0aGlzIGNoYW5nZSBqdXN0IGxlYWQgdG8gYmV0
dGVyCmVycm9yIG1lc3NhZ2VzIHdoZW4gaXQncyBub3QgaW5zdGFsbGVkPwoKV2hhdCBpcyB0aGUg
ZGlzdHJvIHlvdSdyZSB1c2luZz8gVGhlIG9uZXMgd2UgYnVpbGQtdGVzdCBvbiBpbiBnaXRsYWIK
Q0kgKEZlZG9yYSwgRGViaWFuKSBib3RoIGhhdmUgbGliZHcncyBkZXZlbG9wbWVudCBwYWNrYWdl
IGRlcGVuZCBvbgpsaWJsem1hLgoKCi0tIApQZXRyaSBMYXR2YWxhCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmlndC1kZXYgbWFpbGluZyBsaXN0CmlndC1k
ZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21h
aWxtYW4vbGlzdGluZm8vaWd0LWRldg==
