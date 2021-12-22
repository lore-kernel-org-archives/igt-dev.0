Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Message-ID: <68fcbe39-09c5-4df5-8288-1fb07e287990@intel.com>
Date: Tue, 21 Dec 2021 17:21:44 -0800
Content-Language: en-GB
References: <20211213232914.2523139-1-John.C.Harrison@Intel.com>
 <20211213232914.2523139-5-John.C.Harrison@Intel.com>
 <DM6PR11MB4492860E286EBE5F6CB8D1648D7C9@DM6PR11MB4492.namprd11.prod.outlook.com>
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <DM6PR11MB4492860E286EBE5F6CB8D1648D7C9@DM6PR11MB4492.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t 04/11] tests/i915/i915_hangman:
 Explicitly test per engine reset vs full GPU reset
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: "Dandamudi, Priyanka" <priyanka.dandamudi@intel.com>, "IGT-Dev@Lists.FreeDesktop.Org" <IGT-Dev@Lists.FreeDesktop.Org>
Cc: "Intel-GFX@Lists.FreeDesktop.Org" <Intel-GFX@Lists.FreeDesktop.Org>
List-ID: <igt-dev@lists.freedesktop.org>

On 12/21/2021 03:28, Dandamudi, Priyanka wrote:
> Does this test series cover to prove that it can survive killing one without killing all the others except RCS+CCS combination(killing one affects other and shows with the help of reset stats)?
That is part of the purpose of i915_hangman - to test that a hang on one 
engine does not affect work on other engines. Note that there is no CCS 
support in IGT yet. Patches are still in progress. At least, they 
certainly hadn't been merged when this patch set was posted.

John.
