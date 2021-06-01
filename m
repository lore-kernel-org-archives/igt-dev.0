Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
From: "Srinivas, Vidya" <vidya.srinivas@intel.com>
Date: Tue, 1 Jun 2021 14:12:34 +0000
Message-ID: <BY5PR11MB437204DFEDF1D8226D2D1A84893E9@BY5PR11MB4372.namprd11.prod.outlook.com>
References: <1622547939-8157-1-git-send-email-vidya.srinivas@intel.com>
 <YLY5CH3OxmkI1/Qw@platvala-desk.ger.corp.intel.com>
In-Reply-To: <YLY5CH3OxmkI1/Qw@platvala-desk.ger.corp.intel.com>
Content-Language: en-US
MIME-Version: 1.0
Subject: Re: [Intel-gfx] [igt-dev] [PATCH i-g-t] [RFC]
 tests/kms_plane_alpha_blend: Fix coverage-vs-premult-vs-constant tests
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/intel-gfx>
List-Post: <mailto:intel-gfx@lists.freedesktop.org>
List-Help: <mailto:intel-gfx-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>
To: "Latvala, Petri" <petri.latvala@intel.com>
Cc: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Thank you so much Petri. Apologies for the incorrect commit message.
I will submit the patch with the clear commit message.

Regards
Vidya

-----Original Message-----
From: Latvala, Petri <petri.latvala@intel.com> 
Sent: Tuesday, June 1, 2021 7:11 PM
To: Srinivas, Vidya <vidya.srinivas@intel.com>
Cc: intel-gfx@lists.freedesktop.org; igt-dev@lists.freedesktop.org
Subject: Re: [igt-dev] [PATCH i-g-t] [RFC] tests/kms_plane_alpha_blend: Fix coverage-vs-premult-vs-constant tests

On Tue, Jun 01, 2021 at 05:15:39PM +0530, Vidya Srinivas wrote:
> tests/kms_plane_alpha_blend: Fix coverage-vs-premult-vs-constant tests
>
> Few Gen11 systems show CRC mismatch. Make 
> coverage-vs-premult-vs-constant code similar to constant_alpha_min or 
> basic_alpha
> 
> Signed-off-by: Vidya Srinivas <vidya.srinivas@intel.com>


Please make the first line of the commit message a statement that tells what change you're making, and in the full text block state why that's done. "Fix a-b-c tests" is useless later when browsing oneliner git logs. It doesn't even tell which problem is fixed.

Meaning, something like:


==
tests/kms_plane_alpha_blend: Don't set primary fb color in coverage-vs-premult-vs-constant

Similar change has already been done in tests xxx and yyy.
This fixes CRC mismatches seen with some Gen11 systems.

Signed-off-by etc
==


--
Petri Latvala
_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
