Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 26CC26E34B
 for <igt-dev@lists.freedesktop.org>; Mon, 26 Nov 2018 12:55:30 +0000 (UTC)
Date: Mon, 26 Nov 2018 14:55:27 +0200
From: Petri Latvala <petri.latvala@intel.com>
Message-ID: <20181126125527.GE17124@platvala-desk.ger.corp.intel.com>
References: <20181126100824.31623-1-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20181126100824.31623-1-daniel.vetter@ffwll.ch>
Subject: Re: [igt-dev] [PATCH i-g-t] tests: close(fd) without igt_fixture
 considered harmful
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
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: IGT development <igt-dev@lists.freedesktop.org>, Daniel Vetter <daniel.vetter@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

T24gTW9uLCBOb3YgMjYsIDIwMTggYXQgMTE6MDg6MjRBTSArMDEwMCwgRGFuaWVsIFZldHRlciB3
cm90ZToKPiBTb21lIHRlc3RzIGFzc3VtZSB0aGF0IGNsb3NlIG9uIGFuIHVub3BlbmVkIGZkIGlz
IGZpbmUsIGV4Y2VwdCBpdCdzCj4gbm90IGp1c3QgdW5vcGVuZWQgYnV0IGFjdHVhbGx5IHN0YWNr
IGdhcmJhZ2UuIFRoZXJlJ3MgYSBnb29kIGNoYW5jZSB3ZQo+IGVuZCB1cCBydW5uaW5nIGNsb3Nl
KDApLCB3aGljaCB3cmVha3MgdGhlIHRlc3RjYXNlIGVudW1lcmF0aW9uLiBGaXgKPiB0aGlzLgo+
IAo+IE5vdCBzdXJlIHRoZXJlJ3MgYSBiZXR0ZXIgd2F5IHRvIGNhdGNoIHRoaXMgdGhhbiBnaXQg
Z3JlcCBwbHVzIGxvdHMgb2YKPiBtYW51YWwgYXVkaXRpbmcgLi4uIFRoZSB1bml0IHRlc3RzIG9u
bHkgY2F0Y2ggaXQgYnkgYWNjaWRlbnQgKHg4Ngo+IHdvcmtzIGZpbmUsIEkgaGl0IGl0IGluIG9u
ZSB0ZXN0Y2FzZSBvbmx5IGNyb3NzLWJ1aWxkaW5nIHRvIGFhcmNoNjQpLgoKCk5vdCBzdXJlIGlm
IHRoaXMgaXMgYmV0dGVyLi4uIEF0IGxlYXN0IGl0J3MgYSBkb3VibGVjaGVjazoKCiMgZm9yIGEg
aW4gYGZpbmQgLW1heGRlcHRoIDEgLWV4ZWN1dGFibGUgLXR5cGUgZmA7IGRvIHZhbGdyaW5kIC0t
bG9nLWZpbGU9JHthfS52YWxncmluZCAkYSAtLWxpc3Qtc3VidGVzdHM7IGRvbmUKCi4uLgoKIyBn
cmVwICdjbG9zZShmZCknICoudmFsZ3JpbmQKZ2VtX3RpbGVkX2ZlbmNlX2JsaXRzLnZhbGdyaW5k
Oj09MzI3NDY9PSBTeXNjYWxsIHBhcmFtIGNsb3NlKGZkKSBjb250YWlucyB1bmluaXRpYWxpc2Vk
IGJ5dGUocykKZ2VtX3RpbGVkX3N3YXBwaW5nLnZhbGdyaW5kOj09MzI0NDE9PSBTeXNjYWxsIHBh
cmFtIGNsb3NlKGZkKSBjb250YWlucyB1bmluaXRpYWxpc2VkIGJ5dGUocykKCgoKRm9yIGEgYm9u
dXMgbWlzc2luZyBpZ3RfZml4dHVyZSwKZ2VtX2N0eF9wYXJhbS52YWxncmluZDo9PTMyNDgzPT0g
U3lzY2FsbCBwYXJhbSBpb2N0bChmZCkgY29udGFpbnMgdW5pbml0aWFsaXNlZCBieXRlKHMpCgoK
Ci0tIApQZXRyaSBMYXR2YWxhCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmlndC1kZXYgbWFpbGluZyBsaXN0CmlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaWd0LWRl
dgo=
