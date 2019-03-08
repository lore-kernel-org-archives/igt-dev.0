Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF4B86E344
 for <igt-dev@lists.freedesktop.org>; Fri,  8 Mar 2019 19:09:43 +0000 (UTC)
Date: Fri, 8 Mar 2019 21:09:40 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
Message-ID: <20190308190940.GV3888@intel.com>
References: <20190308190107.32514-1-jani.nikula@intel.com>
 <20190308190107.32514-2-jani.nikula@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190308190107.32514-2-jani.nikula@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t 2/2] tools/intel_vbt_decode: check
 inconsistent sequence element size
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
To: Jani Nikula <jani.nikula@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

T24gRnJpLCBNYXIgMDgsIDIwMTkgYXQgMDk6MDE6MDdQTSArMDIwMCwgSmFuaSBOaWt1bGEgd3Jv
dGU6Cj4gQ3Jvc3MgY2hlY2sgYWdhaW5zdCB0aGUgZWxlbWVudCBkdW1wZXIgcmV0dXJuIHZhbHVl
IHRvIGNhdGNoCj4gaW5jb25zaXN0ZW5jaWVzLgo+IAo+IFNpZ25lZC1vZmYtYnk6IEphbmkgTmlr
dWxhIDxqYW5pLm5pa3VsYUBpbnRlbC5jb20+Cj4gLS0tCj4gIHRvb2xzL2ludGVsX3ZidF9kZWNv
ZGUuYyB8IDYgKysrKysrCj4gIDEgZmlsZSBjaGFuZ2VkLCA2IGluc2VydGlvbnMoKykKPiAKPiBk
aWZmIC0tZ2l0IGEvdG9vbHMvaW50ZWxfdmJ0X2RlY29kZS5jIGIvdG9vbHMvaW50ZWxfdmJ0X2Rl
Y29kZS5jCj4gaW5kZXggZGU0Y2M4OGEwNmRkLi41ZjNkYjgwOGQ3MGQgMTAwNjQ0Cj4gLS0tIGEv
dG9vbHMvaW50ZWxfdmJ0X2RlY29kZS5jCj4gKysrIGIvdG9vbHMvaW50ZWxfdmJ0X2RlY29kZS5j
Cj4gQEAgLTEyODksNyArMTI4OSwxMyBAQCBzdGF0aWMgY29uc3QgdWludDhfdCAqZHVtcF9zZXF1
ZW5jZShjb25zdCB1aW50OF90ICpkYXRhLCB1aW50OF90IHNlcV92ZXJzaW9uKQo+ICAJCQlvcGVy
YXRpb25fc2l6ZSA9ICpkYXRhKys7Cj4gIAo+ICAJCWlmIChtaXBpX2VsZW1fZHVtcCkgewo+ICsJ
CQljb25zdCB1aW50OF90ICpuZXh0ID0gZGF0YSArIG9wZXJhdGlvbl9zaXplOwo+ICsKPiAgCQkJ
ZGF0YSA9IG1pcGlfZWxlbV9kdW1wKGRhdGEsIHNlcV92ZXJzaW9uKTsKPiArCj4gKwkJCWlmIChv
cGVyYXRpb25fc2l6ZSAmJiBuZXh0ICE9IGRhdGEpCj4gKwkJCQlwcmludGYoIkVycm9yOiBJbmNv
bnNpc3RlbnQgb3BlcmF0aW9uIHNpemU6ICVkXG4iLAo+ICsJCQkJCW9wZXJhdGlvbl9zaXplKTsK
CkkgZ3Vlc3Mgbm9uLWZhdGFsIGVycm9yIGlzIGJldHRlciB0aGFuIHRoZSBhc3NlcnQgSSBoYWQu
CgpSZXZpZXdlZC1ieTogVmlsbGUgU3lyasOkbMOkIDx2aWxsZS5zeXJqYWxhQGxpbnV4LmludGVs
LmNvbT4KZm9yIGJvdGgKCj4gIAkJfSBlbHNlIGlmIChvcGVyYXRpb25fc2l6ZSkgewo+ICAJCQkv
KiBXZSBoYXZlIHNpemUsIHNraXAuICovCj4gIAkJCWRhdGEgKz0gb3BlcmF0aW9uX3NpemU7Cj4g
LS0gCj4gMi4yMC4xCgotLSAKVmlsbGUgU3lyasOkbMOkCkludGVsCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmlndC1kZXYgbWFpbGluZyBsaXN0CmlndC1k
ZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21h
aWxtYW4vbGlzdGluZm8vaWd0LWRldg==
